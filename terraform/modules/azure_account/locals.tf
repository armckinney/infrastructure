locals {
  tags = module.std_tags.tags

  # Default dashboard JSON definition parameterized with billing properties
  default_dashboard_properties = templatefile("${path.module}/dashboard.json.tpl", {
    billing_account_id = var.billing_account_id
    billing_scope_name = var.billing_scope_name
  })
}
