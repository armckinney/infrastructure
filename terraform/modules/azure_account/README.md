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
