resource "azurerm_portal_dashboard" "this" {
  count = var.enable_dashboard ? 1 : 0

  name                = "${module.std_names.resources.azurerm_resource_group}-dashboard"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  dashboard_properties = var.dashboard_properties != "" ? var.dashboard_properties : local.default_dashboard_properties

  tags = local.tags
}
