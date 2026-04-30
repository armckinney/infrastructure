locals {
  required_tags = {
    application = var.application
    environment = var.environment
    owner       = var.owner
    context     = var.context
    region      = var.region
    costcenter  = var.costcenter
    criticality = var.criticality
  }

  tags = merge(
    var.additional_tags,
    local.required_tags
  )
}
