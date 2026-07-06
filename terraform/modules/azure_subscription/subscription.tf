resource "azurerm_resource_group" "seed" {
  count = var.enable_seed ? 1 : 0

  name     = "${module.std_names.resources.azurerm_resource_group}-seed"
  location = var.location

  tags = local.tags
}

resource "azurerm_resource_group" "network" {
  count = var.enable_networking ? 1 : 0

  name     = "${module.std_names.resources.azurerm_resource_group}-network"
  location = var.location

  tags = local.tags
}
