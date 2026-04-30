#region credentials
# account private key
resource "tls_private_key" "this" {
  count = var.dns_zone != null ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "time_rotating" "this" {
  count = var.dns_zone != null ? 1 : 0

  rotation_days = 59
}

# password for certificate encryption
resource "random_password" "this" {
  count = var.dns_zone != null ? 1 : 0

  length  = 32
  special = true

  keepers = {
    rotation = time_rotating.this.id
  }
}
#endregion

#region acme
# acme registration (let's encrypt account)
resource "acme_registration" "this" {
  count = var.dns_zone != null ? 1 : 0

  email_address   = var.organization_email
  account_key_pem = tls_private_key.this.private_key_pem
}

# request the certificate from let's encrypt
resource "acme_certificate" "this" {
  count = var.dns_zone != null ? 1 : 0

  common_name = "www.${var.application}.${data.azurerm_dns_zone.this.name}"
  subject_alternative_names = [
    "${var.application}.${data.azurerm_dns_zone.this.name}"
  ]
  account_key_pem          = acme_registration.this.account_key_pem
  certificate_p12_password = random_password.this.result

  pre_check_delay = 60

  dns_challenge {
    provider = "azure"
    config = {
      AZURE_ZONE_NAME      = data.azurerm_dns_zone.this.name
      AZURE_RESOURCE_GROUP = data.azurerm_dns_zone.this.resource_group_name
    }
  }
}
#endregion

#region cae certificate

# add certificate to the container app environment
resource "azurerm_container_app_environment_certificate" "this" {
  count = var.dns_zone != null ? 1 : 0

  name                         = module.std_names.resources.azurerm_container_app_environment_certificate
  container_app_environment_id = azurerm_container_app_environment.this.id
  certificate_blob_base64      = acme_certificate.this.certificate_p12
  certificate_password         = acme_certificate.this.certificate_p12_password
  tags                         = local.tags
}
#endregion
