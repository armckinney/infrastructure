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
| <a name="input_resource_type"></a> [resource\_type](#input\_resource\_type) | The type of resource for which the name is being generated (e.g., vm, storage, network). | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_types"></a> [resource\_types](#output\_resource\_types) | n/a |
<!-- END_TF_DOCS -->