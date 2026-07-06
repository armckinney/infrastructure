resource "azurerm_virtual_network" "this" {
  count = var.enable_networking ? 1 : 0

  name                = module.std_names.resources.azurerm_virtual_network
  resource_group_name = azurerm_resource_group.network[0].name
  location            = azurerm_resource_group.network[0].location
  address_space       = [var.vnet_address_space]

  tags = local.tags
}

resource "azurerm_subnet" "subnets" {
  for_each = var.enable_networking ? var.subnets : {}

  name                 = "${module.std_names.resources.azurerm_subnet}-${each.key}"
  resource_group_name  = azurerm_resource_group.network[0].name
  virtual_network_name = azurerm_virtual_network.this[0].name
  address_prefixes     = [each.value]
}
