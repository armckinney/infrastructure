output "id" {
  description = "The ID of the Static Web App"
  value       = azurerm_static_web_app.this.id
}

output "default_host_name" {
  description = "The default host name of the Static Web App"
  value       = azurerm_static_web_app.this.default_host_name
}

output "api_key" {
  description = "The API key / deployment token of the Static Web App"
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true
}

output "custom_domain_validation_tokens" {
  description = "A map of custom domains to their DNS validation tokens"
  value       = { for k, v in azurerm_static_web_app_custom_domain.this : k => v.validation_token }
}
