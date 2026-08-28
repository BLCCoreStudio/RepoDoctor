# RepoDoctor Privacy Notice

**Effective date:** 29 August 2026

This Privacy Notice describes the current data-handling model for the RepoDoctor public preview and the **RepoDoctor CI** GitHub Action published by BLCCoreStudio.

## Current RepoDoctor CI Processing

RepoDoctor CI is designed to scan the repository already checked out inside the GitHub Actions runner. The current Action:

- does not require a RepoDoctor account;
- does not require a GitHub API token for a local checked-out repository scan;
- restricts the configured scan target to `GITHUB_WORKSPACE`;
- downloads the pinned RepoDoctor release binary from the official BLCCoreStudio GitHub release; and
- writes scan results to the GitHub Actions job output according to the selected report format.

The standard RepoDoctor CI local scan is designed to process repository content within the GitHub Actions execution environment rather than upload repository source code to a BLCCoreStudio-hosted scanning service.

## Data That May Be Processed

To perform repository analysis, RepoDoctor may inspect information available in the checked-out repository, including source files, configuration files, manifests, documentation, repository structure, Git metadata, and related project files.

Diagnostic output may contain information such as file paths, repository metadata, rule identifiers, findings, scores, and remediation guidance. Users should treat workflow logs according to the sensitivity of the repository being analyzed.

RepoDoctor is designed not to intentionally print detected secret values into diagnostic output. This does not eliminate the need to review logs and protect sensitive repositories appropriately.

## Network Activity

The RepoDoctor CI wrapper downloads the pinned RepoDoctor release archive from GitHub Releases over HTTPS and verifies it using a pinned SHA-256 digest before execution.

GitHub and any other third-party services used by your workflow process data under their own privacy policies and terms. BLCCoreStudio does not control GitHub's retention of workflow logs, caches, artifacts, or other GitHub-hosted data.

## BLCCoreStudio Storage and Retention

The current RepoDoctor CI local-scan workflow does not require BLCCoreStudio-hosted storage of your repository contents as part of normal Action execution.

If you voluntarily submit information through GitHub Issues, pull requests, discussions, or other support channels, that information is stored and displayed according to GitHub's platform behavior and your chosen visibility. Do not submit secrets or confidential repository contents through public support channels.

## Your Responsibilities

You are responsible for ensuring that you are authorized to analyze the repository and data provided to RepoDoctor and for configuring repository access, GitHub Actions permissions, log retention, and secret handling appropriately.

For private repositories, review generated logs before sharing them outside the authorized team.

## Future GitHub App or Hosted Features

A future RepoDoctor GitHub App, hosted service, account system, billing system, or other feature may require a different data flow. BLCCoreStudio will update this Privacy Notice before representing those future capabilities as covered by the current local Action model.

## Support and Privacy Questions

For non-sensitive questions, use the support path described in [SUPPORT.md](SUPPORT.md).

Do not publish passwords, API keys, access tokens, private keys, confidential source code, private repository contents, or vulnerability details in a public issue.
