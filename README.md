# NetSpokeAsCode

Deploying Netskope SASE as Code using infrastructure-as-code (IaC) and automation via prepackaged OpsLab deployment kits, enabling repeatable, scalable, and policy-integrity-preserving SASE rollouts.

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
