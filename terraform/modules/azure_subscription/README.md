# Azure Subscription Baseline Module

This Terraform module deploys subscription-level baseline infrastructure such as budget definitions, resource groups, networking (VNet & subnets), and remote backend seed state components (Storage Account, Blob Container, Key Vault).

---

## Usage

```hcl
module "azure_subscription" {
  source = "git::https://github.com/armckinney/infrastructure.git//terraform/modules/azure_subscription?ref=v1.0.0"

  application = "my-org"
  environment = "prod"
  owner       = "cloud-ops"
  location    = "East US 2"

  budget_amount          = 1000
  budget_contact_emails  = ["ops-team@example.com"]

  vnet_address_space = "10.0.0.0/16"
  subnets = {
    public  = "10.0.1.0/24"
    private = "10.0.2.0/24"
  }

  enable_seed = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.80.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.9.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_std_names"></a> [std\_names](#module\_std\_names) | ../standardized_resource_names | n/a |
| <a name="module_std_tags"></a> [std\_tags](#module\_std\_tags) | ../standardized_tags | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) | resource |
| [azurerm_key_vault.seed](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_resource_group.network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.seed](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.seed](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [random_string.seed_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Name of the application or service | `string` | n/a | yes |
| <a name="input_budget_alert_threshold"></a> [budget\_alert\_threshold](#input\_budget\_alert\_threshold) | The threshold percentage at which an alert email notification is sent (e.g. 90 for 90%) | `number` | `90` | no |
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | The total monetary amount for the subscription-level consumption budget. Set to 0 to disable. | `number` | `1000` | no |
| <a name="input_budget_contact_emails"></a> [budget\_contact\_emails](#input\_budget\_contact\_emails) | A list of email addresses to receive consumption budget alert notifications | `list(string)` | `[]` | no |
| <a name="input_budget_end_date"></a> [budget\_end\_date](#input\_budget\_end\_date) | The end date for the budget (format YYYY-MM-DDThh:mm:ssZ) | `string` | `"2027-07-01T00:00:00Z"` | no |
| <a name="input_budget_start_date"></a> [budget\_start\_date](#input\_budget\_start\_date) | The start date for the budget (format YYYY-MM-DDThh:mm:ssZ) | `string` | `"2026-07-01T00:00:00Z"` | no |
| <a name="input_budget_time_grain"></a> [budget\_time\_grain](#input\_budget\_time\_grain) | The time grain covered by the budget (e.g. Monthly, Quarterly, Annually) | `string` | `"Monthly"` | no |
| <a name="input_enable_networking"></a> [enable\_networking](#input\_enable\_networking) | Whether to deploy the baseline Virtual Network and Subnets | `bool` | `true` | no |
| <a name="input_enable_seed"></a> [enable\_seed](#input\_enable\_seed) | Whether to deploy the Terraform seed backend (Storage Account, Container, and Key Vault) | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment Environment Name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region to deploy the baseline networking and seed infrastructure | `string` | `"East US 2"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the subscription infrastructure | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A map of subnets to create within the Virtual Network (name -> CIDR prefix) | `map(string)` | <pre>{<br>  "private": "10.0.2.0/24",<br>  "public": "10.0.1.0/24"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources | `map(string)` | `{}` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The CIDR address block for the baseline Virtual Network | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_id"></a> [budget\_id](#output\_budget\_id) | The ID of the subscription consumption budget |
| <a name="output_seed_key_vault_name"></a> [seed\_key\_vault\_name](#output\_seed\_key\_vault\_name) | The name of the Terraform seed key vault |
| <a name="output_seed_resource_group_name"></a> [seed\_resource\_group\_name](#output\_seed\_resource\_group\_name) | The name of the seed resource group |
| <a name="output_seed_storage_account_name"></a> [seed\_storage\_account\_name](#output\_seed\_storage\_account\_name) | The name of the Terraform seed storage account |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | A map of created subnets and their IDs |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the baseline Virtual Network |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the baseline Virtual Network |
<!-- END_TF_DOCS -->