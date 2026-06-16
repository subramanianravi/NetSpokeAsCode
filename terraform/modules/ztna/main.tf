data "netskope_publisher" "this" {
  name = var.publisher_name
}

resource "netskope_private_app" "this" {
  name       = var.private_app_name
  host       = var.private_app_host
  protocol   = var.private_app_protocol
  port       = var.private_app_port
  publishers = [data.netskope_publisher.this.id]
}

output "private_app_id" { value = netskope_private_app.this.id }
