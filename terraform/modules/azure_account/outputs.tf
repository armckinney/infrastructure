output "resource_group_name" {
  description = "The name of the shared account resource group"
  value       = azurerm_resource_group.this.name
}

output "dashboard_id" {
  description = "The ID of the Azure Portal Dashboard if created"
  value       = var.enable_dashboard ? azurerm_portal_dashboard.this[0].id : null
}
