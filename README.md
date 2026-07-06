# Infrastructure

This repository is an Infrastructure as Code (IaC) library containing global reusable Terraform modules and configurations.

---

## Usage

Modules in this repository are versioned and released using [Verge](https://github.com/armckinney/verge) via Git tags. To source any module in your configurations, reference the repository's Git URL along with the target subdirectory and version tag:

```hcl
module "containerapp" {
  source = "git::https://github.com/armckinney/infrastructure.git//terraform/modules/containerapp?ref=v1.0.0"

  application        = "my-app"
  environment        = "dev"
  container_image    = "docker.io/library/nginx:latest"
  organization_email = "admin@example.com"
  
  dns_zone = {
    name        = "example.com"
    application = "my-app"
    environment = "dev"
  }
}
```

---

## Module Index

The following reusable modules are located under `terraform/modules/`:

| Module Name | Description | Sourcing Path |
|:---|:---|:---|
| **[azure_account](file:///workspaces/infrastructure/terraform/modules/azure_account)** | Identity, governance, and monitoring dashboard settings for Azure accounts. | `//terraform/modules/azure_account` |
| **[azure_subscription](file:///workspaces/infrastructure/terraform/modules/azure_subscription)** | Azure subscription baseline setup including budgets, seed resources, and core networking. | `//terraform/modules/azure_subscription` |
| **[containerapp](file:///workspaces/infrastructure/terraform/modules/containerapp)** | Deploys Azure Container App environments with custom domains and auto-renewing SSL certificates. | `//terraform/modules/containerapp` |
| **[example](file:///workspaces/infrastructure/terraform/modules/example)** | A basic demonstration module that creates local files for validation. | `//terraform/modules/example` |
| **[standardized_resource_names](file:///workspaces/infrastructure/terraform/modules/standardized_resource_names)** | Generates consistent naming conventions for Azure resource types based on resource context. | `//terraform/modules/standardized_resource_names` |
| **[standardized_tags](file:///workspaces/infrastructure/terraform/modules/standardized_tags)** | Formulates standardized resource tagging maps (owner, app, environment) for governance. | `//terraform/modules/standardized_tags` |
| **[static_web_app](file:///workspaces/infrastructure/terraform/modules/static_web_app)** | Deploys static web applications to Azure hosting environments. | `//terraform/modules/static_web_app` |

---

## QA & Linting

Continuous integration checks are run automatically on all pushes. You can also run the QA checks locally in your devcontainer:
* `make lint` - Runs Terraform formatting checks and `tflint`.
* `make validate` - Initializes and validates all configurations and modules.
