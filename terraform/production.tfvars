# Production environment — non-sensitive values only.
# Sensitive values (API token, PSK) are injected via TF_VAR_ secrets in CI.

tunnel_name   = "prod-to-netskope"
tunnel_type   = "ipsec"
primary_pop   = "US-SJC1"
secondary_pop = "US-LAX1"
cpe_ip        = "203.0.113.10"

private_app_name     = "prod-internal-app"
private_app_host     = "app.internal.acme.com"
private_app_protocol = "tcp"
private_app_port     = 443
publisher_name       = "prod-publisher-1"

policy_name         = "prod-block-social-media"
policy_action       = "block"
source_users        = ["all-users"]
destination_domains = ["facebook.com", "instagram.com", "tiktok.com"]
dlp_profile         = "pci-dlp-profile"

steering_config_name = "prod-steering"
steering_mode        = "client"
steering_exceptions  = ["8.8.8.8", "internal.acme.com"]
