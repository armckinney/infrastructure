resource "random_string" "seed_suffix" {
  count = var.enable_seed ? 1 : 0

  length  = 6
  special = false
  upper   = false
  numeric = true
}

# trivy:ignore:AZU-0058 - LRS is sufficient and cost-effective for seed remote state backend storage
# trivy:ignore:AZU-0060 - Customer Managed Keys (CMK) are not required for standard seed remote state storage encryption
resource "azurerm_storage_account" "seed" {
  count = var.enable_seed ? 1 : 0

  name                     = "${lower(replace(module.std_names.resources.azurerm_storage_account, "-", ""))}${random_string.seed_suffix[0].result}"
  resource_group_name      = azurerm_resource_group.seed[0].name
  location                 = azurerm_resource_group.seed[0].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"

  infrastructure_encryption_enabled = true

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }

  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 7
    }
  }

  tags = local.tags
}

resource "azurerm_storage_container" "tfstate" {
  count = var.enable_seed ? 1 : 0

  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.seed[0].name
  container_access_type = "private"
}

resource "azurerm_key_vault" "seed" {
  count = var.enable_seed ? 1 : 0

  name                       = "${module.std_names.resources.azurerm_key_vault}-seed"
  resource_group_name        = azurerm_resource_group.seed[0].name
  location                   = azurerm_resource_group.seed[0].location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = true

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = local.tags
}
