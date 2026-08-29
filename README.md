<div align="center">

# RepoDoctor

### Repository health scores and CI quality gates for GitHub Actions

[![Marketplace Action](https://img.shields.io/badge/Marketplace-v0.1.3-1F6FEB?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/marketplace/actions/repodoctor-ci)
[![Engine](https://img.shields.io/badge/engine-0.1.1-5B5BD6?style=for-the-badge)](https://github.com/BLCCoreStudio/RepoDoctor/releases/tag/v0.1.1)
![Status](https://img.shields.io/badge/status-alpha-0891B2?style=for-the-badge)
![Platform](https://img.shields.io/badge/platform-Linux%20x86__64-111827?style=for-the-badge&logo=linux&logoColor=white)

**Score repository health, surface prioritized findings, and add CI quality gates when you are ready to enforce them.**

**[Use as GitHub Action](https://github.com/marketplace/actions/repodoctor-ci)** · **[Download Linux CLI](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64)**

[Action docs](ACTION.md) · [Engine v0.1.1](https://github.com/BLCCoreStudio/RepoDoctor/releases/tag/v0.1.1) · [Security](SECURITY.md) · [Support](SUPPORT.md)

</div>

---

## Choose how to use RepoDoctor

| GitHub Action | Local CLI |
| --- | --- |
| Add repository health checks to CI. Start in report-only mode, then enable quality gates when ready. | Scan locally, inspect the interactive terminal UI, export JSON/HTML, or analyze a public GitHub repository. |
| **[Use RepoDoctor on GitHub Marketplace](https://github.com/marketplace/actions/repodoctor-ci)** | **[Download `repodoctor-linux-x86_64`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64)** |

### Linux CLI — download one file and run

After downloading `repodoctor-linux-x86_64`, the basic flow is only three commands:

```bash
chmod +x repodoctor-linux-x86_64
./repodoctor-linux-x86_64 scan .
./repodoctor-linux-x86_64 ui .
```

No Python installation, virtual environment, pip, uv, or archive extraction is required. The single-file launcher contains the verified RepoDoctor v0.1.1 Linux package and extracts it to a temporary directory only while RepoDoctor is running.

Matching checksum: [`repodoctor-linux-x86_64.sha256`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64.sha256)

## See repository health at a glance

RepoDoctor analyzes repository-wide engineering signals and turns them into a single health view with prioritized findings.

- **One repository-wide health score** instead of disconnected checks.
- **Prioritized findings across eight categories** so you can see what deserves attention first.
- **Optional CI quality gates** so the first run can stay report-only and enforcement can be enabled later.

Use RepoDoctor as a GitHub Marketplace Action for CI, or use the standalone CLI and interactive terminal interface for deeper local inspection.

## Intelligence Console Preview

![RepoDoctor Intelligence Console](docs/repodoctor-intelligence-console.svg)

The preview above is derived from the verified Textual release-candidate render against a controlled example repository. Repository scores and findings vary with the project being analyzed.

## 60-second GitHub Actions setup

Create `.github/workflows/repodoctor.yml` in your repository:

```yaml
name: Repository Health

on:
  pull_request:
  push:
    branches: [main]

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
```

This first-run configuration is **report-only**: repository findings are reported, but they do not fail the job unless you enable `fail-under` or `fail-on`.

### Example result

A controlled example repository can produce output shaped like:

```text
Overall health: 96 / 100 — EXCELLENT
18 passed · 2 warnings · 0 errors
```

Scores and finding counts depend on the repository being analyzed.

## What RepoDoctor checks

RepoDoctor combines repository-level signals across:

- Security
- Repository structure
- Testing
- Documentation
- CI/CD
- Dependencies
- Configuration
- Architecture

The result is an overall health score plus prioritized findings that explain what affected that score.

## Ready to enforce standards?

After you have reviewed report-only results, enable one or both quality gates:

```yaml
- name: Run RepoDoctor
  uses: BLCCoreStudio/RepoDoctor@v0.1.3
  with:
    fail-under: "80"
    fail-on: warning
```

- `fail-under` fails the job when the repository score is below the threshold you choose.
- `fail-on` fails the job when findings reach the selected severity: `info`, `warning`, or `error`.

Both inputs are optional.

## Trust by default

- **No RepoDoctor account required** for the Marketplace Action.
- **No RepoDoctor API key required** for a local checked-out repository scan.
- **Read-only workflow permissions are sufficient** for the documented setup.
- **No repository write permission is required** by RepoDoctor CI.
- The Action downloads a **fixed engine release and verifies its SHA-256 digest** before execution.
- Scan targets are restricted to directories inside **`GITHUB_WORKSPACE`**.

See [ACTION.md](ACTION.md) for every input, security detail, and example.

## Why RepoDoctor

RepoDoctor is designed around three practical questions:

> **How healthy is this repository?**  
> **What is wrong with it?**  
> **What should be fixed first?**

Instead of exposing isolated checks without context, RepoDoctor combines repository-level static-analysis signals with weighted category scores and prioritized findings so teams can decide what matters first.

## Action inputs

| Input | Required | Default | Description |
| --- | --- | --- | --- |
| `path` | No | `.` | Checked-out repository directory to scan. Must resolve inside `GITHUB_WORKSPACE`. |
| `fail-under` | No | empty | Minimum accepted repository score from `0` to `100`. |
| `fail-on` | No | empty | Fail at `info`, `warning`, or `error` severity. |
| `format` | No | `terminal` | `terminal` or `json`. |
| `language` | No | `en` | `en` or `tr`. |

The current Marketplace Action supports Linux x86_64 GitHub Actions runners and executes the verified RepoDoctor `0.1.1` engine.

## Local CLI Quick Start

### Download one file

**[Download `repodoctor-linux-x86_64`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64)**

Then:

```bash
chmod +x repodoctor-linux-x86_64
./repodoctor-linux-x86_64 scan .
./repodoctor-linux-x86_64 ui .
```

Other useful commands:

```bash
# Analyze a public GitHub repository
./repodoctor-linux-x86_64 scan https://github.com/owner/repository

# Turkish output
./repodoctor-linux-x86_64 scan . --lang tr

# Generate JSON
./repodoctor-linux-x86_64 scan . --format json

# Generate HTML
./repodoctor-linux-x86_64 scan . --format html --output repodoctor-report.html
```

Verify the single-file download:

```bash
curl -LO https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64.sha256
sha256sum -c repodoctor-linux-x86_64.sha256
```

## Scoring model

RepoDoctor provides repository diagnostics across eight weighted categories:

| Category | Weight |
| --- | ---: |
| Security | 25% |
| Repository | 12% |
| Testing | 18% |
| Documentation | 10% |
| CI/CD | 10% |
| Dependencies | 10% |
| Configuration | 10% |
| Architecture | 5% |

The result is an overall repository health score plus a prioritized explanation of the problems responsible for that score.

## Highlights

- Repository health scoring
- Security hygiene diagnostics
- Repository structure analysis
- Testing diagnostics
- Documentation analysis
- CI/CD intelligence
- Dependency diagnostics
- Configuration analysis
- Architecture diagnostics
- Repository-level static-analysis signals
- Local repository scanning
- Public GitHub repository scanning
- Stable diagnostic rule IDs
- Built-in rule explanations
- Conservative automated fixes
- SAFE vs REVIEW fix classification
- Terminal, JSON, and HTML reports
- CI quality gates
- English and Turkish interfaces
- Interactive terminal Intelligence Console
- Published GitHub Marketplace Action

## Intelligence Console

RepoDoctor includes a full-screen terminal interface for interactive repository inspection.

```console
repodoctor ui .
```

Turkish interface:

```console
repodoctor ui . --lang tr
```

The interface provides overall health, category scores, finding counts, technology metadata, an interactive diagnostic feed, rule explanations, recommended actions, fix planning, rescanning, and runtime EN/TR switching.

Keyboard controls are visible directly inside the interface:

```text
↑↓       Navigate findings
ENTER    Explain selected rule
F        Open Fix Intelligence
R        Rescan repository
L        Switch language
Q        Quit
```

The interactive UI currently operates on local repositories.

## CLI

### Scan a repository

```console
repodoctor scan .
```

### Scan a public GitHub repository

```console
repodoctor scan https://github.com/owner/repository
```

### Turkish output

```console
repodoctor scan . --lang tr
```

### Explain a diagnostic rule

```console
repodoctor explain architecture.large-python-class
```

### Preview safe fixes

```console
repodoctor fix .
```

### Apply SAFE fixes

```console
repodoctor fix . --apply
```

### Generate JSON

```console
repodoctor scan . --format json
```

### Generate HTML

```console
repodoctor scan . \
    --format html \
    --output repodoctor-report.html
```

## Quality Gates

Require a minimum repository score:

```console
repodoctor scan . --fail-under 90
```

Fail when warnings are detected:

```console
repodoctor scan . --fail-on warning
```

Combine both:

```console
repodoctor scan . \
    --fail-under 90 \
    --fail-on warning
```

## Safe Autofix Philosophy

RepoDoctor separates repair suggestions into two classes.

### SAFE

Changes considered sufficiently predictable for automatic application.

### REVIEW

Changes requiring human judgment. REVIEW fixes are never automatically applied.

The autofix system is intentionally conservative: repository modification should be safer than the recommendation that triggered it.

## Security

RepoDoctor includes repository-security hygiene diagnostics such as:

- Common sensitive files tracked by Git
- Supported secret-pattern detection
- Security policy detection
- Dependency-related repository signals
- Repository configuration checks

Detected secret values are not intentionally printed into RepoDoctor diagnostic output.

RepoDoctor is not a replacement for a dedicated security audit, professional penetration test, or specialized secret-management system.

See [SECURITY.md](SECURITY.md) for vulnerability reporting guidance and [PRIVACY.md](PRIVACY.md) for the current data-handling model.

## Architecture Intelligence

Supported architecture diagnostics include signals such as large source files, large Python classes and functions, deep source layouts, excessive source concentration, Python syntax failures, and conventional source-tree structure.

Architecture checks are intended to surface maintainability risks rather than mandate a single coding style.

## Supported Project Detection

RepoDoctor currently recognizes common repository markers for:

- Python
- Node.js / JavaScript
- Rust
- Go
- Java / Maven
- Java / Gradle
- Ruby
- PHP
- .NET
- Docker

Technology-specific intelligence will continue to expand.

## Download & Installation

RepoDoctor is distributed as prebuilt application packages. The proprietary implementation source code is not required to use the application.

### Linux x86_64 — easiest option

**Status:** Verified  
**Minimum build target:** glibc 2.31+

Download the single-file launcher:

- [`repodoctor-linux-x86_64`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64)
- [`repodoctor-linux-x86_64.sha256`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64.sha256)

Run:

```bash
chmod +x repodoctor-linux-x86_64
./repodoctor-linux-x86_64 scan .
./repodoctor-linux-x86_64 ui .
```

The launcher is self-extracting: it contains the verified v0.1.1 package, runs it from a temporary directory, and removes that temporary directory when the command finishes.

### Linux x86_64 — archive option

The original release archive remains available for users who prefer an extracted installation:

- [`RepoDoctor-v0.1.1-linux-x86_64.tar.gz`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/RepoDoctor-v0.1.1-linux-x86_64.tar.gz)
- [`SHA256SUMS.txt`](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/SHA256SUMS.txt)

```bash
tar -xzf RepoDoctor-v0.1.1-linux-x86_64.tar.gz
cd RepoDoctor-v0.1.1-linux-x86_64
./repodoctor version
./repodoctor scan .
./repodoctor ui .
```

### Platform Support

| Platform | Status |
| --- | --- |
| Linux x86_64 | Verified · glibc 2.31+ |
| Windows | Not yet officially verified or released |
| macOS | Not yet officially verified or released |

## Public Repository Model

> [!IMPORTANT]
> This repository is the official public home, product showcase, Marketplace Action source, and release distribution point for RepoDoctor. The complete RepoDoctor analysis engine is proprietary and is developed in a separate private repository.

The public repository contains the Marketplace Action wrapper, verified engine release binaries and checksums, product documentation, release history, security policy, and selected non-core showcase material. Public visibility of these files does not make the complete RepoDoctor engine open source.

The public export is whitelist-controlled to reduce the risk of accidentally publishing proprietary implementation files. Its validation workflow checks required public files, enforces the tracked-file whitelist, rejects sensitive file types, and blocks designated private implementation paths.

## Current Limitations

RepoDoctor engine `0.1.1` remains alpha. RepoDoctor CI `v0.1.3` is the current Marketplace Action wrapper.

Current limitations include:

- The interactive interface currently accepts local repositories only.
- Autofix intentionally supports a conservative subset of repository modifications.
- Secret detection is pattern-based.
- Technology-specific depth varies by ecosystem.
- The Marketplace Action currently supports Linux x86_64 runners only.
- Repository health scores are engineering signals, not proof of correctness or security.

## Legal, Support, and Release History

RepoDoctor is proprietary software. Copyright © 2026 BLCCoreStudio. All rights reserved.

Use is subject to the [RepoDoctor EULA](EULA.md). See [PRIVACY.md](PRIVACY.md), [SUPPORT.md](SUPPORT.md), [SECURITY.md](SECURITY.md), [LICENSE](LICENSE), and [CHANGELOG.md](CHANGELOG.md) for the applicable policies and release history.

---

<div align="center">

**Built by BLCCoreStudio.**

[Use as GitHub Action](https://github.com/marketplace/actions/repodoctor-ci) · [Download Linux CLI](https://github.com/BLCCoreStudio/RepoDoctor/releases/download/v0.1.1/repodoctor-linux-x86_64) · [Action docs](ACTION.md) · [Support](SUPPORT.md)

</div>