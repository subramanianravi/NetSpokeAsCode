variable "tunnel_name"   { type = string }
variable "tunnel_type"   { type = string }
variable "primary_pop"   { type = string }
variable "secondary_pop" { type = string }
variable "psk"           { type = string; sensitive = true }
variable "cpe_ip"        { type = string }
