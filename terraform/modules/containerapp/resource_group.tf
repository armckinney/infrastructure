resource "azurerm_resource_group" "this" {
  name     = module.std_names.resources.azurerm_resource_group
  location = local.location
  tags     = local.tags
}
