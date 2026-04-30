variable "application" {
  description = "The name of the application for which the resource names are being generated."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]+$", var.application))
    error_message = "Tag 'application' is not alpha-numeric with dashes or underscores"
  }
}

variable "environment" {
  description = "The environment for which the resource names are being generated (e.g., dev, test, prod)."
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Tag 'environment' must be either: dev, test, prod"
  }
}

variable "owner" {
  description = "The owner for which the resource names are being generated."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]+$", var.owner))
    error_message = "Tag 'owner' is not alpha-numeric with dashes or underscores"
  }
}

variable "region" {
  description = "The region for which the resource names are being generated (e.g., eastus, centralus, westus)."
  type        = string
  default     = "undefined"
  validation {
    condition     = contains(["eastus", "centralus", "westus"], var.region)
    error_message = "Tag 'region' must be either: eastus, centralus, westus"
  }
}

variable "context" {
  description = "The context for which the resource names are being generated (e.g., project, team)."
  type        = string
  default     = "undefined"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]+$", var.context))
    error_message = "Tag 'context' is not alpha-numeric with dashes or underscores"
  }
}

variable "costcenter" {
  description = "The cost center for which the resource names are being generated."
  type        = string
  default     = "undefined"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]+$", var.costcenter))
    error_message = "Tag 'costcenter' is not alpha-numeric with dashes or underscores"
  }
}

variable "criticality" {
  description = "The criticality for which the resource names are being generated (e.g., low, medium, high)."
  type        = string
  default     = "undefined"
  validation {
    condition     = contains(["low", "medium", "high"], var.criticality)
    error_message = "Tag 'criticality' must be either: low, medium, high"
  }
}

variable "additional_tags" {
  description = "Additional tags to be applied to the resources."
  type        = map(string)
  default     = {}
}
