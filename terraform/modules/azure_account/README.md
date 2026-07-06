# Azure Account Base Module

This Terraform module deploys per-account infrastructure such as the shared resource group and central portal dashboards.

---

## Usage

```hcl
module "azure_account" {
  source = "git::https://github.com/armckinney/infrastructure.git//terraform/modules/azure_account?ref=v1.0.0"

  application = "my-org-core"
  environment = "prod"
  owner       = "cloud-ops"
  location    = "East US 2"

  enable_dashboard = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.80.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_std_names"></a> [std\_names](#module\_std\_names) | ../standardized_resource_names | n/a |
| <a name="module_std_tags"></a> [std\_tags](#module\_std\_tags) | ../standardized_tags | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_portal_dashboard.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/portal_dashboard) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Name of the application or service | `string` | n/a | yes |
| <a name="input_billing_account_id"></a> [billing\_account\_id](#input\_billing\_account\_id) | The billing account ID to scope the budget and cost management tiles on the dashboard | `string` | `"b6ef8609-119f-5cbe-3e68-23e5d2d14c75:37351691-e8fc-4b3f-80f1-bad6c8657f7f_2019-05-31"` | no |
| <a name="input_billing_scope_name"></a> [billing\_scope\_name](#input\_billing\_scope\_name) | The display name of the billing scope (e.g. Andrew McKinney) | `string` | `"Andrew McKinney"` | no |
| <a name="input_dashboard_properties"></a> [dashboard\_properties](#input\_dashboard\_properties) | Override JSON properties for the Azure Portal Dashboard. If not supplied, a default welcome dashboard is created. | `string` | `""` | no |
| <a name="input_enable_dashboard"></a> [enable\_dashboard](#input\_enable\_dashboard) | Whether to create a central Azure Portal Dashboard for the account | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment Environment Name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region to deploy the account infrastructure (e.g. East US 2, West Europe) | `string` | `"East US 2"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the account infrastructure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dashboard_id"></a> [dashboard\_id](#output\_dashboard\_id) | The ID of the Azure Portal Dashboard if created |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the shared account resource group |
<!-- END_TF_DOCS -->