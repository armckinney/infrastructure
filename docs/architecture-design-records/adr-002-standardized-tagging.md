# ADR: Standardized Resource Tagging

## Status
Accepted

## Context
Resource governance and cost allocation require that all Azure resources be properly tagged. Without structured tags, it is difficult to determine resource ownership, associate costs with specific projects, or determine business criticality. 

To ensure consistency, we maintain the [standardized_tags](file:///workspaces/infrastructure/terraform/modules/standardized_tags) module, which consolidates required and optional metadata.

## Decision
All taggable resources in this repository must implement a standardized tagging map. 

### Mandatory Tags
The `standardized_tags` module defines the following required keys:
*   `application`: The name of the application or service.
*   `environment`: Deployment tier (e.g. dev, staging, prod).
*   `owner`: The team or individual owning the resource.
*   `context`: Context description (defaults to the workspace/module identifier).
*   `region`: The Azure region of the deployment.
*   `costcenter`: Financial billing code for cost allocation.
*   `criticality`: Service tier classification (e.g., low, medium, high).

### Implementation Pattern:
1.  **Define Inputs**: All modules must declare a `tags` map variable in `variables.tf` (defaulting to `{}`).
2.  **Define Locals**: Process and prepare tags inside `locals.tf`.
3.  **Apply to Resources**: Assign `tags = local.tags` to all taggable resource blocks in the module.

### Example Usage:
```hcl
# variables.tf
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

# locals.tf
locals {
  tags = var.tags
}

# static_web_app.tf
resource "azurerm_static_web_app" "this" {
  name                = module.std_names.resources.azurerm_static_web_app
  resource_group_name = var.resource_group_name
  location            = var.location
  
  tags = local.tags
}
```

## Consequences
*   **Traceability**: Every resource will carry critical metadata, enabling clean financial reporting and security classifications.
*   **Tag Merging**: Consuming configurations will pass their environment's tags, which are then cleanly inherited down by all deployed module components.
