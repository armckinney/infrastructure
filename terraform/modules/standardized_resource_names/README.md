<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.10.5 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | The name of the application for which the resource names are being generated. | `string` | n/a | yes |
| <a name="input_context"></a> [context](#input\_context) | The context for which the resource names are being generated (e.g., project, team). | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for which the resource names are being generated (e.g., dev, test, prod). | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The region for which the resource names are being generated (e.g., eastus, centralus, westus). | `string` | `"eastus"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources"></a> [resources](#output\_resources) | n/a |
<!-- END_TF_DOCS -->