output "tunnel_id" {
  description = "ID of the provisioned tunnel"
  value       = module.tunnels.tunnel_id
}

output "tunnel_primary_pop_ip" {
  description = "Public IP of the primary Netskope POP endpoint"
  value       = module.tunnels.primary_pop_ip
}

output "tunnel_secondary_pop_ip" {
  description = "Public IP of the secondary Netskope POP endpoint"
  value       = module.tunnels.secondary_pop_ip
}

output "private_app_id" {
  description = "ID of the provisioned ZTNA private application"
  value       = module.ztna.private_app_id
}

output "policy_id" {
  description = "ID of the provisioned security policy"
  value       = module.policies.policy_id
}

output "steering_config_id" {
  description = "ID of the provisioned steering configuration"
  value       = module.steering.steering_config_id
}
