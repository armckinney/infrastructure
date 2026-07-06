output "seed_resource_group_name" {
  description = "The name of the seed resource group"
  value       = var.enable_seed ? azurerm_resource_group.seed[0].name : null
}

output "seed_storage_account_name" {
  description = "The name of the Terraform seed storage account"
  value       = var.enable_seed ? azurerm_storage_account.seed[0].name : null
}

output "seed_key_vault_name" {
  description = "The name of the Terraform seed key vault"
  value       = var.enable_seed ? azurerm_key_vault.seed[0].name : null
}

output "budget_id" {
  description = "The ID of the subscription consumption budget"
  value       = var.budget_amount > 0 ? azurerm_consumption_budget_subscription.this[0].id : null
}

output "vnet_id" {
  description = "The ID of the baseline Virtual Network"
  value       = var.enable_networking ? azurerm_virtual_network.this[0].id : null
}

output "vnet_name" {
  description = "The name of the baseline Virtual Network"
  value       = var.enable_networking ? azurerm_virtual_network.this[0].name : null
}

output "subnets" {
  description = "A map of created subnets and their IDs"
  value = var.enable_networking ? {
    for k, v in azurerm_subnet.subnets : k => v.id
  } : {}
}
