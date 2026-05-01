resource "azurerm_log_analytics_workspace" "this" {
  name                = module.std_names.resources.azurerm_log_analytics_workspace
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = local.tags
}
