variable "environment" {
  description = "The environment for which to deploy (e.g., dev, test, prod)."
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Variable 'environment' must be either: dev, test, prod"
  }
}
