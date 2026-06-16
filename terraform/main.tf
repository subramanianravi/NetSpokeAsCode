terraform {
  required_version = ">= 1.5.0"

  required_providers {
    netskope = {
      source  = "netskope/netskope"
      version = "~> 0.1"
    }
  }
}

provider "netskope" {
  tenant   = var.netskope_tenant
  apitoken = var.netskope_api_token
}

module "tunnels" {
  source = "./modules/tunnels"

  tunnel_name      = var.tunnel_name
  tunnel_type      = var.tunnel_type
  primary_pop      = var.primary_pop
  secondary_pop    = var.secondary_pop
  psk              = var.tunnel_psk
  cpe_ip           = var.cpe_ip
}

module "ztna" {
  source = "./modules/ztna"

  private_app_name     = var.private_app_name
  private_app_host     = var.private_app_host
  private_app_protocol = var.private_app_protocol
  private_app_port     = var.private_app_port
  publisher_name       = var.publisher_name
}

module "policies" {
  source = "./modules/policies"

  policy_name         = var.policy_name
  policy_action       = var.policy_action
  source_users        = var.source_users
  destination_domains = var.destination_domains
  dlp_profile         = var.dlp_profile
}

module "steering" {
  source = "./modules/steering"

  steering_config_name = var.steering_config_name
  steering_mode        = var.steering_mode
  exceptions           = var.steering_exceptions
}
