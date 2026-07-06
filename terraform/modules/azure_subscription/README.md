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
