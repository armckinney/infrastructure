variable "application" {
  description = "The name of the application for which the resource names are being generated."
  type        = string
}

variable "environment" {
  description = "The environment for which the resource names are being generated (e.g., dev, test, prod)."
  type        = string
}

variable "location" {
  description = "The region for which the resource names are being generated (e.g., eastus, centralus, westus)."
  type        = string
  default     = "eastus"
}

variable "context" {
  description = "The context for which the resource names are being generated (e.g., project, team)."
  type        = string
  default     = null
}

# instances-specific objects will return and instance_id placeholder that will need to be regex swapped
