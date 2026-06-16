variable "policy_name"         { type = string }
variable "policy_action"       { type = string }
variable "source_users"        { type = list(string) }
variable "destination_domains" { type = list(string) }
variable "dlp_profile"         { type = string }
