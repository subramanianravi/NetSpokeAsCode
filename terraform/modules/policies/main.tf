data "netskope_dlp_profile" "this" {
  count = var.dlp_profile != "" ? 1 : 0
  name  = var.dlp_profile
}

resource "netskope_url_policy" "this" {
  name    = var.policy_name
  action  = var.policy_action
  enabled = true

  source_criteria {
    users = var.source_users
  }

  destination_criteria {
    domains = var.destination_domains
  }

  dynamic "dlp" {
    for_each = var.dlp_profile != "" ? [1] : []
    content {
      profile_id = data.netskope_dlp_profile.this[0].id
    }
  }
}

output "policy_id" { value = netskope_url_policy.this.id }
