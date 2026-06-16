resource "netskope_steering_config" "this" {
  name = var.steering_config_name
  mode = var.steering_mode

  dynamic "exception" {
    for_each = var.exceptions
    content {
      value = exception.value
    }
  }
}

output "steering_config_id" { value = netskope_steering_config.this.id }
