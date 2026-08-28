# RepoDoctor Support

This document describes the public support channels for RepoDoctor and RepoDoctor CI.

## General Support

For usage questions, reproducible bugs, compatibility reports, and feature requests, use the public GitHub issue tracker:

https://github.com/BLCCoreStudio/RepoDoctor/issues

Before opening an issue, please check existing issues and the current documentation in [README.md](README.md) and [ACTION.md](ACTION.md).

When reporting a problem, include only information that is safe to publish publicly, such as:

- RepoDoctor version or Action tag
- operating system / runner type
- the command or workflow configuration used
- expected behavior
- observed behavior
- minimal reproduction steps
- sanitized logs

Do **not** include passwords, API keys, access tokens, private keys, confidential source code, private repository contents, or other secrets.

## Security Vulnerabilities

Do not report suspected vulnerabilities in a public issue.

Follow [SECURITY.md](SECURITY.md). If GitHub offers a private vulnerability-reporting option for this repository, use that private channel. If a private reporting channel is not available, open only a non-sensitive public issue requesting a private contact path and do not include vulnerability details or secrets in that issue.

## Current Support Scope

The current public preview supports:

- RepoDoctor `0.1.x` releases
- Linux x86_64 release binaries with the documented glibc requirement
- RepoDoctor CI on supported Linux x86_64 GitHub Actions runners
- documented CLI, TUI, report, and quality-gate behavior

Windows and macOS are not currently official release targets unless a future release explicitly states otherwise.

## Response Times

RepoDoctor is currently an alpha / public-preview product. The free preview does not include a guaranteed response time or service-level agreement.

Future paid or enterprise plans may define separate support terms and service levels. Those terms will apply only when explicitly included with the relevant plan or agreement.

## Product Status

Support does not change the product's current alpha status. RepoDoctor findings and scores are engineering signals and are not a substitute for a professional security audit, penetration test, legal review, or other specialized assessment.
