# Security Policy

## Reporting a Vulnerability

Please do not disclose potential RepoDoctor vulnerabilities publicly before
BLCCoreStudio has had an opportunity to investigate them.

When reporting a security issue, include:

- The affected RepoDoctor version
- The operating system and Python version
- Reproduction steps
- Expected and observed behavior
- Relevant logs with secrets removed
- Potential security impact

Do not include passwords, API keys, private keys, access tokens, credentials,
or confidential repository contents in a report.

## Supported Version

RepoDoctor is currently in alpha development.

| Version | Supported |
|---|---|
| 0.1.x | Yes |

## Scope

Security reports may include issues involving:

- Repository parsing
- Secret-handling behavior
- Temporary repository handling
- GitHub repository inspection
- Autofix safety
- File-system modifications
- Report generation
- Dependency handling

RepoDoctor diagnostics are not a substitute for a complete professional
security audit.
