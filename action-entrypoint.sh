#!/usr/bin/env bash
set -euo pipefail

readonly REPODOCTOR_VERSION="0.1.1"
readonly REPODOCTOR_TAG="v${REPODOCTOR_VERSION}"
readonly REPODOCTOR_ASSET="RepoDoctor-v${REPODOCTOR_VERSION}-linux-x86_64.tar.gz"
readonly REPODOCTOR_SHA256="9861e7b759e35da7a6fb913b7c6ee665f3e69b783129733c4d35d465dd1ec064"
readonly REPODOCTOR_RELEASE_URL="https://github.com/BLCCoreStudio/RepoDoctor/releases/download/${REPODOCTOR_TAG}/${REPODOCTOR_ASSET}"

fail() {
  printf 'RepoDoctor Action: %s\n' "$1" >&2
  exit 2
}

if [[ "$(uname -s)" != "Linux" ]]; then
  fail "the current Marketplace preview supports Linux runners only."
fi

case "$(uname -m)" in
  x86_64|amd64)
    ;;
  *)
    fail "the current Marketplace preview supports x86_64 runners only."
    ;;
esac

for command_name in curl sha256sum tar find realpath; do
  command -v "$command_name" >/dev/null 2>&1 \
    || fail "required command '${command_name}' is not available on this runner."
done

scan_path="${REPODOCTOR_INPUT_PATH:-.}"
fail_under="${REPODOCTOR_INPUT_FAIL_UNDER:-}"
fail_on="${REPODOCTOR_INPUT_FAIL_ON:-}"
report_format="${REPODOCTOR_INPUT_FORMAT:-terminal}"
language="${REPODOCTOR_INPUT_LANGUAGE:-en}"

case "$report_format" in
  terminal|json)
    ;;
  *)
    fail "format must be 'terminal' or 'json'."
    ;;
esac

case "$language" in
  en|tr)
    ;;
  *)
    fail "language must be 'en' or 'tr'."
    ;;
esac

if [[ -n "$fail_under" ]]; then
  if [[ ! "$fail_under" =~ ^[0-9]+$ ]] || (( fail_under < 0 || fail_under > 100 )); then
    fail "fail-under must be an integer from 0 to 100."
  fi
fi

if [[ -n "$fail_on" ]]; then
  case "$fail_on" in
    info|warning|error)
      ;;
    *)
      fail "fail-on must be 'info', 'warning', or 'error'."
      ;;
  esac
fi

[[ -d "$scan_path" ]] || fail "path must point to an existing directory."
scan_path="$(realpath -e -- "$scan_path")" \
  || fail "path could not be resolved."

if [[ -n "${GITHUB_WORKSPACE:-}" ]]; then
  workspace="$(realpath -e -- "$GITHUB_WORKSPACE")" \
    || fail "GITHUB_WORKSPACE could not be resolved."

  case "${scan_path}/" in
    "${workspace}/"*)
      ;;
    *)
      fail "path must stay inside GITHUB_WORKSPACE."
      ;;
  esac
fi

work_dir="$(mktemp -d -t repodoctor-action.XXXXXXXXXX)"
cleanup() {
  rm -rf -- "$work_dir"
}
trap cleanup EXIT

archive_path="${work_dir}/${REPODOCTOR_ASSET}"

printf 'RepoDoctor Action: downloading RepoDoctor %s...\n' "$REPODOCTOR_VERSION"
curl \
  --fail \
  --silent \
  --show-error \
  --location \
  --proto '=https' \
  --tlsv1.2 \
  --retry 3 \
  --retry-delay 1 \
  --retry-all-errors \
  --connect-timeout 10 \
  --max-time 120 \
  --output "$archive_path" \
  "$REPODOCTOR_RELEASE_URL"

printf '%s  %s\n' "$REPODOCTOR_SHA256" "$archive_path" | sha256sum --check --status \
  || fail "downloaded release archive failed SHA-256 verification."

archive_listing="$(tar -tzf "$archive_path")" \
  || fail "release archive could not be inspected."

while IFS= read -r entry; do
  [[ -n "$entry" ]] || continue

  case "$entry" in
    /*)
      fail "release archive contains an absolute path."
      ;;
  esac

  if [[ "$entry" == ".." || "$entry" == ../* || "$entry" == */../* || "$entry" == */.. ]]; then
    fail "release archive contains path traversal components."
  fi
done <<< "$archive_listing"

extract_dir="${work_dir}/extracted"
mkdir -p "$extract_dir"
tar \
  --extract \
  --gzip \
  --file "$archive_path" \
  --directory "$extract_dir" \
  --no-same-owner \
  --no-same-permissions

repodoctor_binary="$(find "$extract_dir" -type f -name repodoctor -print -quit)"
[[ -n "$repodoctor_binary" ]] || fail "release archive did not contain the RepoDoctor executable."
[[ ! -L "$repodoctor_binary" ]] || fail "RepoDoctor executable must not be a symbolic link."
chmod u+x "$repodoctor_binary"

args=(
  scan
  "$scan_path"
  --format "$report_format"
  --lang "$language"
)

if [[ -n "$fail_under" ]]; then
  args+=(--fail-under "$fail_under")
fi

if [[ -n "$fail_on" ]]; then
  args+=(--fail-on "$fail_on")
fi

printf 'RepoDoctor Action: scanning %s\n' "$scan_path"
"$repodoctor_binary" "${args[@]}"
