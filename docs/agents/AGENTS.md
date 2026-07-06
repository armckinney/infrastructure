# Project Rules

## Customization Rules Management

- **Single Source of Truth**: All configuration rules and guidelines for AI agents must be updated and maintained **exclusively** in the master file: [docs/agents/AGENTS.md](file:///workspaces/infrastructure/docs/agents/AGENTS.md).
- **Tooling Propagation**: Never modify symlinked rules files (such as `.agents/AGENTS.md` or `.github/copilot-instructions.md`) directly. Always apply changes to this master file so they instantly propagate across all AI assistant configurations in the workspace.

## Architecture Design Records (ADR)

- **Immutable Log**: All architectural design decisions must be documented sequentially under `docs/architecture-design-records/` using the three-digit sequential naming format: `adr-###-name-of-adr.md` (e.g. `adr-001-standardized-naming.md`). Once accepted, they serve as the immutable log of architecture history.

## Terraform Module Structure

All Terraform modules in this repository must strictly adhere to the following file layout:
- **`main.tf`**: Must ONLY contain the `terraform {}` and provider configuration blocks. No resource blocks are allowed in this file.
- **`locals.tf`**: Must contain all local values (`locals {}` blocks) for variables and tags.
- **`variables.tf`**: Must define all input variables.
- **`outputs.tf`**: Must define all output values.
- **`data.tf`** (Optional): Used if the module fetches configuration or resources from external data sources.
- **`<resource_type>.tf`** (e.g. `static_web_app.tf`): Resource definitions must be split out of `main.tf` and stored in separate resource-specific files.
- **`QA/Testing Registration`**: Any new Terraform module created in the `terraform/modules/` directory must be added as a test module instantiation in the `tests` configuration file at [tests.tf](file:///workspaces/infrastructure/terraform/configurations/tests/tests.tf) to ensure it is validated and linted during the CI static-analysis QA checks.
- **`Standardized Naming`**: Reusable modules must not accept arbitrary resource name inputs (e.g. `variable "name"`). Instead, they must instantiate the `standardized_resource_names` module (as `module "std_names"`) in `main.tf` and reference its outputs to name resources.
- **`Standardized Tagging`**: Reusable modules must implement standard resource tagging by accepting a `tags` map variable, processing it in `locals.tf`, and applying it to all taggable resource blocks in the module.
