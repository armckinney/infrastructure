<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.10.5 |
| <a name="requirement_acme"></a> [acme](#requirement\_acme) | 2.32.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.30.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.7.2 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.13.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_account"></a> [azure\_account](#module\_azure\_account) | ../../modules/azure_account | n/a |
| <a name="module_azure_subscription"></a> [azure\_subscription](#module\_azure\_subscription) | ../../modules/azure_subscription | n/a |
| <a name="module_containerapp"></a> [containerapp](#module\_containerapp) | ../../modules/containerapp | n/a |
| <a name="module_example"></a> [example](#module\_example) | ../../modules/example | n/a |
| <a name="module_standardized_resource_names"></a> [standardized\_resource\_names](#module\_standardized\_resource\_names) | ../../modules/standardized_resource_names | n/a |
| <a name="module_standardized_tags"></a> [standardized\_tags](#module\_standardized\_tags) | ../../modules/standardized_tags | n/a |
| <a name="module_static_web_app"></a> [static\_web\_app](#module\_static\_web\_app) | ../../modules/static_web_app | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for which to deploy (e.g., dev, test, prod). | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->