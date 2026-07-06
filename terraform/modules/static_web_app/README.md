# Azure Static Web App Reusable Module

This Terraform module provisions an Azure Static Web App, custom domain mappings, and outputs the deployment credentials.

---

## Usage

```hcl
module "static_web_app" {
  source = "git::https://github.com/armckinney/infrastructure.git//terraform/modules/static_web_app?ref=v1.0.0"

  application         = "my-app"
  environment         = "dev"
  resource_group_name = "rg-my-application"
  location            = "East US 2"
  sku_tier            = "Standard"
  sku_size            = "Standard"

  tags = {
    owner = "my-team"
  }

  custom_domains = [
    "example.com"
  ]

  app_settings = {
    API_URL = "https://api.example.com"
  }
}
```

---

## Deploying Source Code in Consumer Repositories

Azure Static Web Apps separate infrastructure provisioning (Terraform) from application code deployments (CI/CD workflows). 

Once Terraform creates the infrastructure, the consuming repository's GitHub Actions workflow builds and uploads the static files.

### 1. Store the Deployment Token
The module outputs the deployment token via `api_key` (which is marked as sensitive). You can export this token to your consuming repository's secrets (e.g. as `AZURE_STATIC_WEB_APPS_API_TOKEN`).

### 2. Configure GitHub Actions in the Consuming Repo
Add the following job to the consuming repository's CI/CD pipeline (e.g., `.github/workflows/deploy.yml`) to deploy your frontend code (React, Vue, HTML, etc.):

```yaml
name: Deploy Frontend

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Source Code
        uses: actions/checkout@v4

      - name: Build and Deploy
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/"          # Path to frontend source code
          output_location: "build"   # Build output folder (e.g. build, dist, or out)
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

## Resources

| Name | Type |
|------|------|
| [azurerm_static_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app) | resource |
| [azurerm_static_web_app_custom_domain.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app_custom_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of application settings for the Static Web App | `map(string)` | `{}` | no |
| <a name="input_application"></a> [application](#input\_application) | Name of the application to deploy | `string` | n/a | yes |
| <a name="input_custom_domains"></a> [custom\_domains](#input\_custom\_domains) | A list of custom domains to associate with the Static Web App | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment Environment Name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Static Web App should be created (e.g. East US 2, West US 2, West Europe) | `string` | `"East US 2"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Static Web App | `string` | n/a | yes |
| <a name="input_sku_size"></a> [sku\_size](#input\_sku\_size) | The SKU size of the Static Web App (e.g. Free, Standard) | `string` | `"Free"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU tier of the Static Web App (e.g. Free, Standard) | `string` | `"Free"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key"></a> [api\_key](#output\_api\_key) | The API key / deployment token of the Static Web App |
| <a name="output_custom_domain_validation_tokens"></a> [custom\_domain\_validation\_tokens](#output\_custom\_domain\_validation\_tokens) | A map of custom domains to their DNS validation tokens |
| <a name="output_default_host_name"></a> [default\_host\_name](#output\_default\_host\_name) | The default host name of the Static Web App |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Static Web App |
<!-- END_TF_DOCS -->