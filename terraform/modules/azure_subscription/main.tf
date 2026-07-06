terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

module "std_names" {
  source = "../standardized_resource_names"

  application = var.application
  environment = var.environment
  location    = var.location
}

module "std_tags" {
  source = "../standardized_tags"

  application     = var.application
  environment     = var.environment
  owner           = var.owner
  additional_tags = var.tags
}
