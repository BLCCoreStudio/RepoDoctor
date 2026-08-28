# Changelog

All notable RepoDoctor releases will be documented here.

## 0.1.3 - 2026-08-29

Marketplace presentation and adoption-focused update for **RepoDoctor CI**. The Action runtime behavior and pinned RepoDoctor engine remain unchanged from the v0.1.2 launch.

### Changed

- Reworked the Marketplace README to put GitHub Actions installation before the large product preview and local CLI instructions.
- Tightened the top-of-page value proposition around repository health scoring and CI quality gates.
- Reduced top-level badge clutter and moved glibc details to platform support.
- Added clear trust signals for no RepoDoctor account, no RepoDoctor API key, read-only workflow permissions, no required repository write permission, SHA-256 verification, and `GITHUB_WORKSPACE` isolation.
- Sharpened the Marketplace Action description to focus on repository health scoring and enforceable CI gates.
- Updated Action usage examples to `BLCCoreStudio/RepoDoctor@v0.1.3`.

### Validation

- RepoDoctor CI was validated as an external consumer Action in `BLCCoreStudio/HashCheck` using the published Marketplace package.
- The consumer workflow successfully executed RepoDoctor with a minimum repository-health score gate and error-severity gate.
- RepoDoctor Action smoke tests and public repository validation remain required before merge.

### Notes

- Marketplace Action release: `BLCCoreStudio/RepoDoctor@v0.1.3`.
- RepoDoctor CI v0.1.3 continues to execute the verified RepoDoctor `0.1.1` Linux x86_64 engine.
- The engine remains alpha.

## 0.1.2 - 2026-08-29

First GitHub Marketplace release of **RepoDoctor CI**.

### Added

- Published the RepoDoctor CI GitHub Action to GitHub Marketplace.
- Added repository-score quality gates with `fail-under`.
- Added severity-based failure gates with `fail-on`.
- Added terminal and JSON output options for GitHub Actions.
- Added English and Turkish Action output selection.
- Added an authentic Intelligence Console preview to the public README.
- Added EULA, privacy, support, and Marketplace-facing documentation.

### Security and reliability

- Enforced read-only workflow permissions in documented usage.
- Restricted Action scan targets to `GITHUB_WORKSPACE`.
- Added bounded network retries and download timeouts.
- Added SHA-256 verification for the downloaded RepoDoctor engine archive.
- Added archive path validation before extraction.
- Pinned GitHub Actions dependencies by commit SHA.

### Validation

- Passed the complete RepoDoctor test suite with 392 tests.
- Passed CI on Python 3.11 and Python 3.14.
- Passed end-to-end CLI checks for help, version, terminal, JSON and HTML reports, rule explanation, and safe-fix preview.
- Passed real Textual UI lifecycle, render, language-toggle, and rescan checks.
- Verified the published RepoDoctor 0.1.1 Linux binary by download, SHA-256 validation, and end-to-end execution.
- Passed RepoDoctor Action smoke tests and public repository validation.

### Notes

- Marketplace Action release: `BLCCoreStudio/RepoDoctor@v0.1.2`.
- The Action currently supports Linux x86_64 GitHub-hosted runners.
- The Action currently executes the verified RepoDoctor `0.1.1` engine, which remains alpha.

## 0.1.1 - 2026-08-28

Maintenance release focused on detection accuracy and CI reliability.

### Fixed

- Improved Shell project and shell-test detection.
- Recognized tests stored under `.github/tests`.
- Improved CI test detection for delegated Make targets such as `make ci` and shell-invoked test scripts.
- Prevented intentional test fixture key and certificate material from causing fatal security scores.
- Fixed generic secret false positives when secret-named variables receive values from function calls.

### Changed

- RepoDoctor self-scan now acts as a CI quality gate and fails on error-level findings.
- Added regression coverage for the updated detection behavior.

### Notes

RepoDoctor 0.1.1 remains an alpha pre-release.

## 0.1.0 - 2026-08-26

Initial public preview.

### Added

- Repository health scoring across eight diagnostic categories
- Security hygiene diagnostics
- Repository structure analysis
- Test and documentation diagnostics
- CI/CD analysis
- Dependency diagnostics
- Configuration diagnostics
- Architecture diagnostics
- Local repository scanning
- GitHub repository scanning
- Stable diagnostic rule IDs
- Rule explanations
- Conservative SAFE/REVIEW autofix workflow
- Terminal reports
- JSON reports
- HTML reports
- CI quality gates
- English and Turkish interfaces
- Interactive Intelligence Console

### Notes

RepoDoctor 0.1.0 is an alpha release.

The public repository contains selected showcase material. Proprietary
analysis-engine implementation is maintained separately by BLCCoreStudio.
