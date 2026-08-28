# RepoDoctor GitHub Action

RepoDoctor can run as a GitHub Action against the repository already checked out on the runner. The Action is currently a Marketplace-readiness preview and has not yet been published as a stable Marketplace release.

## What it does

The Action runs the RepoDoctor repository-health scan inside GitHub Actions and can optionally fail the job when a repository falls below a minimum score or contains findings at a selected severity.

Current scan areas include security, repository structure, testing, documentation, CI/CD, dependencies, configuration, and architecture.

## Requirements

The current preview supports GitHub Actions runners with:

- Linux
- x86_64 architecture
- `curl`, `sha256sum`, `tar`, and `find`

The wrapper currently pins the RepoDoctor `0.1.1` Linux x86_64 release and verifies the downloaded archive against its published SHA-256 digest before execution.

## Recommended workflow permissions

RepoDoctor only needs the checked-out repository for a local Action scan. Start with read-only workflow permissions:

```yaml
permissions:
  contents: read
```

Do not grant write permissions unless a future RepoDoctor feature explicitly requires them.

## Usage

A consuming workflow must check out the repository before running RepoDoctor.

After a Marketplace release is published, pin the Action to the published release tag rather than `main`:

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
    steps:
      - name: Checkout repository
        uses: actions/checkout@v7

      - name: Run RepoDoctor
        uses: BLCCoreStudio/RepoDoctor@<published-tag>
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
| `path` | No | `.` | Checked-out repository directory to scan. |
| `fail-under` | No | empty | Minimum accepted repository score from `0` to `100`. Empty disables the score gate. |
| `fail-on` | No | empty | Fail at `info`, `warning`, or `error` severity. Empty keeps report-only behavior. |
| `format` | No | `terminal` | `terminal` or `json`. |
| `language` | No | `en` | `en` or `tr`. |

## Examples

Report only:

```yaml
- uses: BLCCoreStudio/RepoDoctor@<published-tag>
  with:
    format: json
```

Require a score of at least 85:

```yaml
- uses: BLCCoreStudio/RepoDoctor@<published-tag>
  with:
    fail-under: "85"
```

Fail on error-level findings:

```yaml
- uses: BLCCoreStudio/RepoDoctor@<published-tag>
  with:
    fail-on: error
```

## Security model

The Action wrapper:

- downloads the pinned RepoDoctor release over HTTPS
- verifies the release archive with a pinned SHA-256 digest before execution
- passes user inputs as shell arguments without `eval`
- uses a temporary working directory and removes it on exit
- does not require a GitHub token for a local checked-out repository scan

The RepoDoctor engine remains proprietary software distributed through the official RepoDoctor release artifacts. See [LICENSE](LICENSE) and [SECURITY.md](SECURITY.md).

## Current limitations

- The Marketplace Action has not yet been published as a stable release.
- The Action wrapper currently supports Linux x86_64 runners only.
- The pinned engine version is currently `0.1.1`, which is an alpha pre-release.
- This Action is not a GitHub App. Using the Action does not create a GitHub App installation.

These limitations will remain explicit until the corresponding capabilities are implemented and verified.
