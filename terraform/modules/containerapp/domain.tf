resource "azurerm_container_app_custom_domain" "this" {
  count = var.dns_zone != null ? 1 : 0

  name                                     = trimsuffix(trimprefix(azurerm_dns_txt_record.this.fqdn, "asuid."), ".")
  container_app_id                         = azurerm_container_app.this.id
  certificate_binding_type                 = "SniEnabled"
  container_app_environment_certificate_id = azurerm_container_app_environment_certificate.this[0].id
}

resource "azurerm_dns_cname_record" "this" {
  count = var.dns_zone != null ? 1 : 0

  name                = var.application
  zone_name           = data.azurerm_dns_zone.this.name
  resource_group_name = data.azurerm_dns_zone.this.resource_group_name
  ttl                 = 3600
  record              = azurerm_container_app.this.latest_revision_fqdn
  tags                = local.tags
}

resource "azurerm_dns_txt_record" "this" {
  count = var.dns_zone != null ? 1 : 0

  name                = "asuid.${var.application}"
  zone_name           = data.azurerm_dns_zone.this.name
  resource_group_name = data.azurerm_dns_zone.this.resource_group_name
  ttl                 = 3600
  tags                = local.tags
  record {
    value = azurerm_container_app.this.custom_domain_verification_id
  }
}
