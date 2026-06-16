# NetSpokeAsCode

Deploying Netskope SASE as Code using infrastructure-as-code (IaC) and automation via prepackaged OpsLab deployment kits, enabling repeatable, scalable, and policy-integrity-preserving SASE rollouts.

## Getting Started

### Prerequisites

| Tool | Minimum Version |
|------|----------------|
| [Terraform](https://developer.hashicorp.com/terraform/install) | 1.5.0 |
| [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/) | 2.14 |
| Netskope tenant | One SASE (with API access enabled) |

You will need a Netskope REST API token. Generate one in your tenant under **Settings → Administration → API/Cloud Access Token**.

### Option A — Terraform

```bash
# 1. Clone the repo
git clone https://github.com/subramanianravi/NetSpokeAsCode.git
cd NetSpokeAsCode

# 2. Fill in your parameters
cp terraform/terraform.tfvars.example terraform/terraform.tfvars
# Edit terraform/terraform.tfvars with your tenant URL, API token, and resource values

# 3. Initialise and apply
terraform -chdir=terraform init
terraform -chdir=terraform plan
terraform -chdir=terraform apply
```

**What gets provisioned:**
- IPsec/GRE tunnel to your primary (and optionally secondary) Netskope POP
- ZTNA private application bound to a named Publisher
- URL security policy with optional DLP profile
- Traffic steering configuration with bypass exceptions

### Option B — Ansible

```bash
# 1. Clone the repo
git clone https://github.com/subramanianravi/NetSpokeAsCode.git
cd NetSpokeAsCode

# 2. Fill in your parameters
cp ansible/group_vars/all.yml.example ansible/group_vars/all.yml
cp ansible/inventory/hosts.yml.example ansible/inventory/hosts.yml
# Edit ansible/group_vars/all.yml with your tenant URL, API token, and resource values

# 3. Run the playbook
ansible-playbook -i ansible/inventory/hosts.yml ansible/site.yml
```

### Key Parameters

| Parameter | Description | Example |
|-----------|-------------|---------|
| `netskope_tenant` | Your Netskope tenant URL | `acme.goskope.com` |
| `netskope_api_token` | REST API token (sensitive) | — |
| `tunnel_name` | Display name for the tunnel | `hq-to-netskope` |
| `tunnel_type` | Protocol: `ipsec` or `gre` | `ipsec` |
| `primary_pop` | Netskope POP location | `US-SJC1` |
| `secondary_pop` | HA failover POP (optional) | `US-LAX1` |
| `cpe_ip` | Public IP of your CPE or NGFW | `203.0.113.10` |
| `private_app_host` | Hostname of the private app | `jira.internal.acme.com` |
| `policy_action` | `allow`, `block`, or `alert` | `block` |
| `steering_mode` | `client` or `tunnel` | `client` |

Full parameter reference: [`terraform/variables.tf`](terraform/variables.tf) / [`ansible/group_vars/all.yml.example`](ansible/group_vars/all.yml.example)

> **Security note:** Never commit `terraform.tfvars` or `ansible/group_vars/all.yml` — both are excluded by `.gitignore`. Use a secrets manager or environment variables (`TF_VAR_netskope_api_token`) in CI/CD pipelines.

## Why IaC Works for Netskope SASE

Netskope's **one engine, one client, one gateway** architecture consolidates SD-WAN, Security Service Edge (SSE), and Zero Trust Network Access (ZTNA) into a single cloud-native platform. This convergence reduces the number of point products and agents, making it easier to automate configuration, policy enforcement, and lifecycle management.

## Key Automation Capabilities

**Prepackaged OpsLab Deployment Kits** — vendor-agnostic automation for:

- **Tunnel Deployment**: Automated IPsec/GRE tunnel creation from CPEs, NGFWs, or SD-WAN to Netskope POPs, with high availability, dual-tunnel resilience, and zero-touch lifecycle management.
- **Migrations**: Automated translation of heterogeneous vendor policies into Netskope-compatible configurations, preserving policy integrity.
- **Operations**: Continuous policy enforcement, network performance optimization, and adaptation to POP changes.
- **Lifecycle Management**: Automate key management, POP changes, and connectivity maintenance in hybrid environments.

## How to Implement as Code

### 1. Define Infrastructure in IaC Format

Use Terraform, Ansible, or Netskope's OpsLab automation framework to model:

- POPs (NewEdge Points of Presence)
- Tunnel endpoints (CPEs, SD-WAN, NGFWs)
- Security policies (SWG, CASB, ZTNA, FWaaS, DLP)
- Zero Trust client deployment

### 2. Leverage OpsLab Automation

- Deploy tunnels and gateways via OpsLab kits
- Migrate existing policies using pre-validated automation
- Enforce consistent, always-on connectivity

### 3. Integrate with CI/CD Pipelines

- Automate SASE infrastructure provisioning alongside application deployments
- Use OpsLab for rollback and disaster recovery automation

### 4. Policy as Code

- Store security policies in version-controlled repositories
- Automate policy push to Netskope One SASE via OpsLab or API

## Benefits

| Benefit | Description |
|---------|-------------|
| **Consistency** | Single source of truth for infrastructure and policies |
| **Scalability** | Rapid deployment across multiple sites or cloud tenants |
| **Reduced Risk** | Automated migrations minimize manual errors |
| **Operational Efficiency** | Streamlined lifecycle management and reduced agent sprawl |
