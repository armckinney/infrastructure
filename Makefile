TF_CONFIGS_DIR := terraform/configurations
TF_MODULES_DIR := terraform/modules

.PHONY: all lint test docs fmt clean help

all: lint test docs

# TODO: make this help programatic with doc strings
help:
	@echo "Available targets:"
	@echo "  lint    - Run terraform fmt and tflint"
	@echo "  test    - Validate all Terraform configurations and modules"
	@echo "  docs    - Generate README.md for all configurations and modules using terraform-docs"
	@echo "  fmt     - Format all Terraform code"
	@echo "  clean   - Remove .terraform directories"
	@echo "  all     - Run lint, test, and docs"

# TODO: get rid of echos
lint:
	@echo "Linting Terraform code..."
	terraform fmt -check -recursive
	tflint --recursive

fmt:
	@echo "Formatting Terraform code..."
	terraform fmt -recursive

# TODO: consider adding trivy, and validate
test:
	@echo "Validating Terraform configurations..."
	@find $(TF_CONFIGS_DIR) -type d -maxdepth 1 -mindepth 1 | xargs -I {} sh -c 'echo "Validating {}..."; cd {} && terraform init -backend=false && terraform validate'
	@echo "Validating Terraform modules..."
	@find $(TF_MODULES_DIR) -type d -maxdepth 1 -mindepth 1 | xargs -I {} sh -c 'echo "Validating {}..."; cd {} && terraform init -backend=false && terraform validate'

docs:
	@echo "Generating documentation..."
	@echo "Generating docs for configurations..."
	@cd $(TF_CONFIGS_DIR) && terraform-docs .
	@echo "Generating docs for modules..."
	@cd $(TF_MODULES_DIR) && terraform-docs .

clean:
	@echo "Cleaning up .terraform directories..."
	find . -name ".terraform" -type d -exec rm -rf {} +
