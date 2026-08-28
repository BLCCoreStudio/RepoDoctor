# Changelog

All notable RepoDoctor releases will be documented here.

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
