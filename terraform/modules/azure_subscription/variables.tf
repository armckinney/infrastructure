variable "application" {
  description = "Name of the application or service"
  type        = string
}

variable "environment" {
  description = "Deployment Environment Name"
  type        = string
}

variable "owner" {
  description = "The owner of the subscription infrastructure"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the baseline networking and seed infrastructure"
  type        = string
  default     = "East US 2"
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

# Seed settings
variable "enable_seed" {
  description = "Whether to deploy the Terraform seed backend (Storage Account, Container, and Key Vault)"
  type        = bool
  default     = true
}

# Budget settings
variable "budget_amount" {
  description = "The total monetary amount for the subscription-level consumption budget. Set to 0 to disable."
  type        = number
  default     = 1000
}

variable "budget_time_grain" {
  description = "The time grain covered by the budget (e.g. Monthly, Quarterly, Annually)"
  type        = string
  default     = "Monthly"
}

variable "budget_start_date" {
  description = "The start date for the budget (format YYYY-MM-DDThh:mm:ssZ)"
  type        = string
  default     = "2026-07-01T00:00:00Z"
}

variable "budget_end_date" {
  description = "The end date for the budget (format YYYY-MM-DDThh:mm:ssZ)"
  type        = string
  default     = "2027-07-01T00:00:00Z"
}

variable "budget_alert_threshold" {
  description = "The threshold percentage at which an alert email notification is sent (e.g. 90 for 90%)"
  type        = number
  default     = 90
}

variable "budget_contact_emails" {
  description = "A list of email addresses to receive consumption budget alert notifications"
  type        = list(string)
  default     = []
}

# Networking settings
variable "enable_networking" {
  description = "Whether to deploy the baseline Virtual Network and Subnets"
  type        = bool
  default     = true
}

variable "vnet_address_space" {
  description = "The CIDR address block for the baseline Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "A map of subnets to create within the Virtual Network (name -> CIDR prefix)"
  type        = map(string)
  default = {
    public  = "10.0.1.0/24"
    private = "10.0.2.0/24"
  }
}
