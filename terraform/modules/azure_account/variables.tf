variable "application" {
  description = "Name of the application or service"
  type        = string
}

variable "environment" {
  description = "Deployment Environment Name"
  type        = string
}

variable "owner" {
  description = "The owner of the account infrastructure"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the account infrastructure (e.g. East US 2, West Europe)"
  type        = string
  default     = "East US 2"
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "enable_dashboard" {
  description = "Whether to create a central Azure Portal Dashboard for the account"
  type        = bool
  default     = true
}

variable "dashboard_properties" {
  description = "Override JSON properties for the Azure Portal Dashboard. If not supplied, a default welcome dashboard is created."
  type        = string
  default     = ""
}

variable "billing_account_id" {
  description = "The billing account ID to scope the budget and cost management tiles on the dashboard"
  type        = string
  default     = "b6ef8609-119f-5cbe-3e68-23e5d2d14c75:37351691-e8fc-4b3f-80f1-bad6c8657f7f_2019-05-31"
}

variable "billing_scope_name" {
  description = "The display name of the billing scope (e.g. Andrew McKinney)"
  type        = string
  default     = "Andrew McKinney"
}
