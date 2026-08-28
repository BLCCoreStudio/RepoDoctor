# RepoDoctor GitHub Action

**Marketplace name:** `RepoDoctor CI`

RepoDoctor runs as a published GitHub Marketplace Action against a repository already checked out on the runner. The current Marketplace presentation release is `v0.1.3`; it continues to execute the verified RepoDoctor `0.1.1` engine.

## What it does

The Action runs the RepoDoctor repository-health scan inside GitHub Actions and can optionally fail the job when a repository falls below a minimum score or contains findings at a selected severity.

Current scan areas include security, repository structure, testing, documentation, CI/CD, dependencies, configuration, and architecture.

## Requirements

The current Marketplace release supports GitHub Actions runners with:

- Linux
- x86_64 architecture
- `curl`, `sha256sum`, `tar`, `find`, and `realpath`

The wrapper pins the RepoDoctor `0.1.1` Linux x86_64 engine release and verifies the downloaded archive against its published SHA-256 digest before execution.

## Recommended workflow permissions

RepoDoctor only needs the checked-out repository for a local Action scan. Start with read-only workflow permissions:

```yaml
permissions:
  contents: read
```

Do not grant write permissions unless a future RepoDoctor feature explicitly requires them.

## Usage

A consuming workflow must check out the repository before running RepoDoctor. RepoDoctor restricts the scan target to a directory inside `GITHUB_WORKSPACE` so an accidental Action input cannot scan unrelated runner paths.

Pin the Action to the published Marketplace release tag rather than `main`:

```yaml
name: Repository Health

on:
  pull_request:
  push:
    branches:
      - main

permissions:
  contents: read

jobs:
  repodoctor:
    runs-on: ubuntu-latest
    timeout-minutes: 10
    steps:
      - name: Checkout repository
        uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7

      - name: Run RepoDoctor
        uses: BLCCoreStudio/RepoDoctor@v0.1.3
        with:
          path: .
          fail-under: "80"
          fail-on: warning
          format: terminal
          language: en
```

For development of the Action itself, this repository tests the local Action with `uses: ./`.

## Inputs

| Input | Required | Default | Description |
| --- | --- | --- | --- |
| `path` | No | `.` | Checked-out repository directory to scan. It must resolve inside `GITHUB_WORKSPACE`. |
| `fail-under` | No | empty | Minimum accepted repository score from `0` to `100`. Empty disables the score gate. |
| `fail-on` | No | empty | Fail at `info`, `warning`, or `error` severity. Empty keeps report-only behavior. |
| `format` | No | `terminal` | `terminal` or `json`. |
| `language` | No | `en` | `en` or `tr`. |

## Examples

Report only:

```yaml
- uses: BLCCoreStudio/RepoDoctor@v0.1.3
  with:
    format: json
```

Require a score of at least 85:

```yaml
- uses: BLCCoreStudio/RepoDoctor@v0.1.3
  with:
    fail-under: "85"
```

Fail on error-level findings:

```yaml
- uses: BLCCoreStudio/RepoDoctor@v0.1.3
  with:
    fail-on: error
```

## Security model

The Action wrapper:

- downloads a fixed RepoDoctor engine release over HTTPS
- uses connection and total download time limits plus bounded retries
- verifies the release archive with a pinned SHA-256 digest before execution
- inspects archive paths before extraction and rejects absolute or traversal paths
- extracts without preserving archive ownership or permissions
- rejects scan targets outside `GITHUB_WORKSPACE`
- passes user inputs as shell arguments without `eval`
- uses a temporary working directory and removes it on exit
- does not require a RepoDoctor account or RepoDoctor API key for a local checked-out repository scan
- does not require repository write permissions for the documented workflow

The RepoDoctor engine remains proprietary software distributed through the official RepoDoctor release artifacts. See [LICENSE](LICENSE) and [SECURITY.md](SECURITY.md).

## Legal, Privacy, and Support

Use of RepoDoctor and RepoDoctor CI is subject to the [RepoDoctor EULA](EULA.md).

The current Action data-handling model is described in [PRIVACY.md](PRIVACY.md). General support is available through the channels in [SUPPORT.md](SUPPORT.md), while suspected security vulnerabilities must follow [SECURITY.md](SECURITY.md).

Do not publish credentials, access tokens, private keys, confidential repository contents, or vulnerability details in public support issues.

## Current limitations

- The Action wrapper currently supports Linux x86_64 runners only.
- The pinned RepoDoctor engine version is `0.1.1`, which remains alpha.
- This Action is not a GitHub App. Using the Action does not create a GitHub App installation.
- Marketplace pricing plans apply to GitHub Apps/OAuth apps, not this Action wrapper.

These limitations will remain explicit until the corresponding capabilities are implemented and verified.
