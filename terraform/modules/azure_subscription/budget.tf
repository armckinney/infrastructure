resource "azurerm_consumption_budget_subscription" "this" {
  count = var.budget_amount > 0 ? 1 : 0

  name            = "${module.std_names.resources.azurerm_resource_group}-budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.budget_amount
  time_grain = var.budget_time_grain

  time_period {
    start_date = var.budget_start_date
    end_date   = var.budget_end_date
  }

  notification {
    enabled        = true
    threshold      = var.budget_alert_threshold
    operator       = "GreaterThan"
    threshold_type = "Actual"
    contact_emails = var.budget_contact_emails
  }
}
