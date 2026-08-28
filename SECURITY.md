# Security Policy

## Reporting a Vulnerability

Please do not disclose potential RepoDoctor vulnerabilities publicly before
BLCCoreStudio has had an opportunity to investigate them.

If GitHub offers a private vulnerability-reporting option for this repository,
use that private channel. If a private reporting channel is not available,
open only a non-sensitive public issue requesting a private contact path and do
not include vulnerability details, exploit steps, credentials, secrets, or
confidential repository contents in that issue.

When reporting a security issue through a private channel, include:

- The affected RepoDoctor version
- The operating system and Python version, when relevant
- Reproduction steps
- Expected and observed behavior
- Relevant sanitized logs
- Potential security impact

Do not include passwords, API keys, private keys, access tokens, credentials,
or confidential repository contents in a public report.

For non-security support, see [SUPPORT.md](SUPPORT.md).

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
- RepoDoctor CI Action behavior
- Autofix safety
- File-system modifications
- Report generation
- Dependency handling

RepoDoctor diagnostics are not a substitute for a complete professional
security audit.
