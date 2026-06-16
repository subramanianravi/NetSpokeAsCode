# Contributing to NetSpokeAsCode

Thank you for your interest in contributing. This guide covers how to get started, submit changes, and keep contributions consistent.

## Getting Started

1. Fork the repository and clone your fork
2. Create a branch from `main` for your changes
3. Make your changes, following the guidelines below
4. Open a pull request against `main`

## Branch Naming

Use descriptive, lowercase, hyphen-separated names:

- `feature/tunnel-deployment-terraform`
- `fix/ztna-policy-typo`
- `docs/ansible-playbook-guide`

## Commit Messages

Write short, imperative-mood commit messages:

- `Add Terraform module for IPsec tunnel deployment`
- `Fix ZTNA policy variable naming`
- `Update OpsLab migration instructions`

## What to Contribute

- Terraform modules, Ansible playbooks, or OpsLab automation scripts
- CI/CD pipeline examples for SASE provisioning
- Policy-as-code templates (SWG, CASB, ZTNA, FWaaS, DLP)
- Bug fixes and documentation improvements

## Code Guidelines

- Keep files under 500 lines
- Never commit secrets, credentials, or `.env` files
- Use variables for any environment-specific values (tenant IDs, endpoints, keys)
- Include inline comments only where the intent is non-obvious

## Pull Request Process

1. Ensure your branch is up to date with `main` before opening a PR
2. Describe what your PR does and why in the PR description
3. Link any related issues
4. A maintainer will review and merge once approved

## Reporting Issues

Open a GitHub issue with:
- A clear title describing the problem
- Steps to reproduce
- Expected vs actual behaviour
- Environment details (tool versions, OS)

## Code of Conduct

Be respectful and constructive. Contributions of all experience levels are welcome.
