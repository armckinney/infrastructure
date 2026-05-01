variable "application" {
  description = "Name of the application to deploy"
  type        = string
}

variable "environment" {
  description = "Deployment Environment Name"
  type        = string
}

variable "container_image" {
  description = "Container image to deploy in the container app"
  type        = string
  default     = "docker.io/hello-world:latest"
}

variable "dns_zone" {
  description = "DNS Zone object containing the name and resource group for the DNS zone"
  type = object({
    name        = string
    application = string
    environment = string
  })
  default = null
}

variable "organization_email" {
  description = "Email address used for ACME registration and certificate expiration notifications"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
