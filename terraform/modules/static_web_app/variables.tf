variable "application" {
  description = "Name of the application to deploy"
  type        = string
}

variable "environment" {
  description = "Deployment Environment Name"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Static Web App"
  type        = string
}

variable "location" {
  description = "The Azure region where the Static Web App should be created (e.g. East US 2, West US 2, West Europe)"
  type        = string
  default     = "East US 2"
}

variable "sku_tier" {
  description = "The SKU tier of the Static Web App (e.g. Free, Standard)"
  type        = string
  default     = "Free"
}

variable "sku_size" {
  description = "The SKU size of the Static Web App (e.g. Free, Standard)"
  type        = string
  default     = "Free"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "custom_domains" {
  description = "A list of custom domains to associate with the Static Web App"
  type        = list(string)
  default     = []
}

variable "app_settings" {
  description = "A map of application settings for the Static Web App"
  type        = map(string)
  default     = {}
}
