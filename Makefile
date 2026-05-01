TF_CONFIGS_DIR := terraform/configurations
TF_MODULES_DIR := terraform/modules

.DEFAULT_GOAL := help

.PHONY: all lint test validate secure docs fmt clean help

all: lint test docs ## Run lint, test, and docs

help: ## Show available targets
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z0-9_.-]+:.*## / {printf "  %-12s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

lint: ## Run terraform fmt check and tflint
	terraform fmt -check -recursive
	tflint --recursive --minimum-failure-severity=error

format: ## Generate README.md docs for all configurations and modules and run terraform fmt
	terraform fmt -recursive
	@cd $(TF_CONFIGS_DIR) && terraform-docs .
	@cd $(TF_MODULES_DIR) && terraform-docs .

test: validate secure ## Run validate and security checks

validate: ## Validate all Terraform configurations and modules
	@find $(TF_CONFIGS_DIR) -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 -I {} sh -c 'cd "{}" && terraform init -backend=false -input=false && terraform validate'
	@find $(TF_MODULES_DIR) -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 -I {} sh -c 'cd "{}" && terraform init -backend=false -input=false && terraform validate'

secure: ## Run Trivy IaC scan when available
	@if command -v trivy >/dev/null 2>&1; then \
		trivy config --misconfig-scanners terraform $(TF_CONFIGS_DIR); \
		trivy config --misconfig-scanners terraform $(TF_MODULES_DIR); \
	else \
		printf '%s\n' 'trivy not installed, skipping IaC scan'; \
	fi

clean: ## Remove Terraform working directories and local state cache files
	find . -name ".terraform" -type d -exec rm -rf {} +
	find . -name ".terraform.lock.hcl" -type f -delete
