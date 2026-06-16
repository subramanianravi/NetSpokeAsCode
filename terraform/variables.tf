# ── Netskope Tenant ──────────────────────────────────────────────────────────

variable "netskope_tenant" {
  description = "Netskope tenant URL (e.g. acme.goskope.com)"
  type        = string
}

variable "netskope_api_token" {
  description = "Netskope REST API token — provide via tfvars or TF_VAR_netskope_api_token"
  type        = string
  sensitive   = true
}

# ── Tunnels ───────────────────────────────────────────────────────────────────

variable "tunnel_name" {
  description = "Display name for the IPsec/GRE tunnel"
  type        = string
}

variable "tunnel_type" {
  description = "Tunnel protocol: ipsec or gre"
  type        = string
  default     = "ipsec"

  validation {
    condition     = contains(["ipsec", "gre"], var.tunnel_type)
    error_message = "tunnel_type must be 'ipsec' or 'gre'."
  }
}

variable "primary_pop" {
  description = "Primary Netskope POP location (e.g. US-SJC1)"
  type        = string
}

variable "secondary_pop" {
  description = "Secondary Netskope POP for HA failover"
  type        = string
  default     = ""
}

variable "tunnel_psk" {
  description = "Pre-shared key for IPsec tunnel authentication"
  type        = string
  sensitive   = true
}

variable "cpe_ip" {
  description = "Public IP address of the on-premises CPE or NGFW"
  type        = string
}

# ── ZTNA / Private Access ─────────────────────────────────────────────────────

variable "private_app_name" {
  description = "Display name for the private application"
  type        = string
}

variable "private_app_host" {
  description = "Hostname or IP of the private application"
  type        = string
}

variable "private_app_protocol" {
  description = "Protocol for the private app: tcp or udp"
  type        = string
  default     = "tcp"
}

variable "private_app_port" {
  description = "Port number for the private application"
  type        = number
}

variable "publisher_name" {
  description = "Name of the Netskope Publisher serving the private app"
  type        = string
}

# ── Security Policies ─────────────────────────────────────────────────────────

variable "policy_name" {
  description = "Name of the security policy"
  type        = string
}

variable "policy_action" {
  description = "Policy action: allow, block, or alert"
  type        = string
  default     = "allow"

  validation {
    condition     = contains(["allow", "block", "alert"], var.policy_action)
    error_message = "policy_action must be 'allow', 'block', or 'alert'."
  }
}

variable "source_users" {
  description = "List of user or group identities the policy applies to"
  type        = list(string)
  default     = []
}

variable "destination_domains" {
  description = "List of destination domains or categories for the policy"
  type        = list(string)
  default     = []
}

variable "dlp_profile" {
  description = "DLP profile name to attach to this policy (leave empty to skip)"
  type        = string
  default     = ""
}

# ── Steering ──────────────────────────────────────────────────────────────────

variable "steering_config_name" {
  description = "Name of the steering configuration"
  type        = string
}

variable "steering_mode" {
  description = "Steering mode: tunnel or client"
  type        = string
  default     = "client"

  validation {
    condition     = contains(["tunnel", "client"], var.steering_mode)
    error_message = "steering_mode must be 'tunnel' or 'client'."
  }
}

variable "steering_exceptions" {
  description = "List of domains or IPs to exclude from steering"
  type        = list(string)
  default     = []
}
