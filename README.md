# RepoDoctor

**Professional repository intelligence by BLCCoreStudio.**

RepoDoctor analyzes software repositories and turns repository health into actionable diagnostics across security, testing, documentation, CI/CD, dependencies, configuration, repository structure, and architecture.

It is designed around three questions:

> How healthy is this repository?

> What is wrong with it?

> What should be fixed first?

---

## Public Preview

**Current version:** `0.1.0`
**Status:** Alpha

This repository is the official public preview and product showcase for RepoDoctor.

The complete RepoDoctor analysis engine is proprietary and is developed in a separate private repository.

This public repository intentionally contains selected documentation, release information, security policy, and limited non-core showcase material only.

It is **not** the complete RepoDoctor source distribution.

---

## What RepoDoctor Does

RepoDoctor provides repository diagnostics across eight weighted categories:

| Category | Weight |
|---|---:|
| Security | 25% |
| Repository | 12% |
| Testing | 18% |
| Documentation | 10% |
| CI/CD | 10% |
| Dependencies | 10% |
| Configuration | 10% |
| Architecture | 5% |

The result is both an overall repository health score and a prioritized explanation of the problems responsible for that score.

---

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
- Local repository scanning
- GitHub repository scanning
- Stable diagnostic rule IDs
- Built-in rule explanations
- Conservative automated fixes
- SAFE vs REVIEW fix classification
- Terminal reports
- JSON reports
- HTML reports
- CI quality gates
- English and Turkish interfaces
- Interactive terminal Intelligence Console

---

## Intelligence Console

RepoDoctor includes a full-screen terminal interface for interactive repository inspection.

Typical usage:

```console
repodoctor ui .
```

Turkish interface:

```console
repodoctor ui . --lang tr
```

The interface provides:

- Overall repository health
- Category scores
- Finding counts
- Technology metadata
- Interactive diagnostic feed
- Rule explanations
- Recommended actions
- Fix planning
- Repository rescanning
- Runtime EN/TR switching

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

---

## CLI

RepoDoctor is also designed for traditional terminal and automation workflows.

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

---

## Quality Gates

RepoDoctor can be used as a CI quality gate.

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

---

## Safe Autofix Philosophy

RepoDoctor separates repair suggestions into two classes.

### SAFE

Changes considered sufficiently predictable for automatic application.

### REVIEW

Changes requiring human judgment.

REVIEW fixes are never automatically applied.

The autofix system is intentionally conservative: repository modification should be safer than the recommendation that triggered it.

---

## Security

RepoDoctor includes repository-security hygiene diagnostics such as:

- Common sensitive files tracked by Git
- Supported secret-pattern detection
- Security policy detection
- Dependency-related repository signals
- Repository configuration checks

Detected secret values are not intentionally printed into RepoDoctor diagnostic output.

RepoDoctor is not a replacement for a dedicated security audit, professional penetration test, or specialized secret-management system.

See [SECURITY.md](SECURITY.md) for vulnerability reporting guidance.

---

## Architecture Intelligence

Supported architecture diagnostics include signals such as:

- Large source files
- Large Python classes
- Large Python functions
- Deep source layouts
- Excessive source concentration
- Python syntax failures
- Conventional source-tree structure

Architecture checks are intended to surface maintainability risks rather than mandate a single coding style.

---

## Supported Project Detection

RepoDoctor currently recognizes common repository markers for technologies including:

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

---

## Distribution

The complete RepoDoctor implementation is **not distributed as source code through this public repository**.

Official installation packages and release artifacts, when made available, will be published through BLCCoreStudio-controlled distribution channels and/or the GitHub Releases section of this repository.

Do not treat the contents of this repository as a buildable copy of the commercial RepoDoctor engine.

---

## Public Repository Model

BLCCoreStudio maintains RepoDoctor using a split development model:

```text
Private development repository
        │
        ├── analysis engine
        ├── diagnostics
        ├── autofix implementation
        ├── GitHub intelligence
        ├── internal tests
        └── release engineering

                ↓ reviewed export

Public repository
        │
        ├── product documentation
        ├── release history
        ├── security policy
        ├── selected showcase material
        └── public release information
```

The public export is whitelist-controlled to reduce the risk of accidentally publishing proprietary implementation files.

---

## Public Source Disclosure

Files visible in this repository are intentionally selected for public inspection.

Their visibility does **not** imply that the complete RepoDoctor implementation is open source.

No rights beyond those explicitly stated in the repository license are granted.

---

## Current Limitations

RepoDoctor `0.1.0` is an alpha release.

Current limitations include:

- The interactive interface currently accepts local repositories only.
- Autofix intentionally supports a conservative subset of repository modifications.
- Secret detection is pattern-based.
- Technology-specific depth varies by ecosystem.
- Repository health scores are engineering signals, not proof of correctness or security.

---

## Release History

See [CHANGELOG.md](CHANGELOG.md).

---

## Security Reports

Please review [SECURITY.md](SECURITY.md) before reporting a security issue.

Do not include credentials, private keys, API tokens, or confidential repository data in public reports.

---

## Rights and Licensing

RepoDoctor is proprietary software.

Copyright © 2026 BLCCoreStudio.

All rights reserved.

Public visibility of selected files does not constitute an open-source license.

See [LICENSE](LICENSE) for the applicable terms.

---

**Built by BLCCoreStudio.**
