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
