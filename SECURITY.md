# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.1.x   | ✓         |

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Please report security issues by emailing **s.ravisubramanian@gmail.com** with the subject line `[SECURITY] NetSpokeAsCode - <brief description>`.

Include as much of the following as possible:

- Description of the vulnerability and potential impact
- Steps to reproduce or proof-of-concept
- Affected versions or components
- Any suggested mitigations

## Response Process

1. You will receive an acknowledgement within **48 hours**
2. The maintainer will investigate and confirm the issue within **7 days**
3. A fix will be developed and tested, with a target turnaround of **14 days** for critical issues
4. A new release will be published and the reporter credited (unless anonymity is requested)

## Scope

This policy covers:

- Terraform modules, Ansible playbooks, and automation scripts in this repository
- CI/CD pipeline configurations
- Policy-as-code templates

### Out of Scope

- Vulnerabilities in third-party tools (Terraform, Ansible, Netskope platform) — report those to the respective vendors
- Issues in dependencies outside this repository's control

## Security Best Practices for Contributors

- Never commit secrets, credentials, API keys, or `.env` files
- Use variables or secret managers for all sensitive values
- Validate all external inputs at system boundaries
- Follow the principle of least privilege in all IAM and policy configurations
