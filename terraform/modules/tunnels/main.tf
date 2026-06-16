resource "netskope_tunnel" "primary" {
  name     = var.tunnel_name
  type     = var.tunnel_type
  pop      = var.primary_pop
  psk      = var.psk
  cpe_ip   = var.cpe_ip
}

resource "netskope_tunnel" "secondary" {
  count    = var.secondary_pop != "" ? 1 : 0

  name     = "${var.tunnel_name}-ha"
  type     = var.tunnel_type
  pop      = var.secondary_pop
  psk      = var.psk
  cpe_ip   = var.cpe_ip
}

output "tunnel_id"          { value = netskope_tunnel.primary.id }
output "primary_pop_ip"     { value = netskope_tunnel.primary.pop_ip }
output "secondary_pop_ip"   {
  value = length(netskope_tunnel.secondary) > 0 ? netskope_tunnel.secondary[0].pop_ip : null
}
