# ADR: Standardized Azure Resource Naming

## Status
Accepted

## Context
As the infrastructure codebase grows with multiple modules, resource naming conventions must remain consistent. Inconsistent naming makes resources difficult to discover, audit, and trace back to their respective applications and environments. Furthermore, Azure has strict character limits and naming rules (e.g., lowercase only for storage accounts) that vary by resource type.

To solve this, we maintain a central naming conventions mapping in the [standardized_resource_names](file:///workspaces/infrastructure/terraform/modules/standardized_resource_names) module.

## Decision
All reusable modules must not accept arbitrary resource names from the consumer. Instead, they must:
1. Accept `application` and `environment` as input variables.
2. Sourcing the `standardized_resource_names` sub-module inside `main.tf`.
3. Use the computed name output for the resources.

### Example Usage:
```hcl
# main.tf of a module
module "std_names" {
  source = "../standardized_resource_names"

  application = var.application
  environment = var.environment
  location    = var.location
}

# static_web_app.tf of the module
resource "azurerm_static_web_app" "this" {
  name                = module.std_names.resources.azurerm_static_web_app
  resource_group_name = var.resource_group_name
  location            = var.location
  ...
}
```

## Consequences
* **Consistency**: Every resource deployed by this repository will share the same prefix structure (e.g. `rg-<app>-<env>` for resource groups, `stapp-<app>-<env>` for static web apps).
* **Fewer Inputs**: Consumers of modules do not need to specify individual names for resources, reducing boilerplate.
* **Adding New Resource Types**: If a new resource type is added to the infrastructure library, its naming formula must first be added to [locals.tf](file:///workspaces/infrastructure/terraform/modules/standardized_resource_names/locals.tf) under the `standardized_resource_names` module.
