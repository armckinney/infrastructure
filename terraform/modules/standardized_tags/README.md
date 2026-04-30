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
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to be applied to the resources. | `map(string)` | `{}` | no |
| <a name="input_application"></a> [application](#input\_application) | The name of the application for which the resource names are being generated. | `string` | n/a | yes |
| <a name="input_context"></a> [context](#input\_context) | The context for which the resource names are being generated (e.g., project, team). | `string` | `"undefined"` | no |
| <a name="input_costcenter"></a> [costcenter](#input\_costcenter) | The cost center for which the resource names are being generated. | `string` | `"undefined"` | no |
| <a name="input_criticality"></a> [criticality](#input\_criticality) | The criticality for which the resource names are being generated (e.g., low, medium, high). | `string` | `"undefined"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for which the resource names are being generated (e.g., dev, test, prod). | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner for which the resource names are being generated. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region for which the resource names are being generated (e.g., eastus, centralus, westus). | `string` | `"undefined"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
<!-- END_TF_DOCS -->