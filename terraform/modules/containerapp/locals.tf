locals {
  location                = "eastus"
  dns_zone_resource_group = join("-", ["rg", var.dns_zone.application, var.dns_zone.environment])
  required_tags = {
    application = var.application
    environment = var.environment
  }

  tags = merge(var.tags, local.required_tags)
}
