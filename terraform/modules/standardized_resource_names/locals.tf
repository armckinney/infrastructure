locals {
  resource_types = {
    # organization
    azurerm_resource_group = join("-", ["rg", var.application, var.environment])

    # compute / web
    azurerm_linux_web_app    = join("-", ["app", var.application, var.environment])
    azurerm_app_service_plan = join("-", ["asp", var.application, var.environment])
    azurerm_static_web_app   = join("-", ["stapp", var.application, var.environment])

    # containers
    container                                     = join("-", ["cntr", var.application, var.environment])
    azurerm_container_app                         = join("-", ["ca", var.application, var.environment])
    azurerm_container_app_environment             = join("-", ["cae", var.application, var.environment])
    azurerm_container_app_environment_certificate = join("-", ["cert", var.application, var.environment])
    azurerm_container_registry                    = join("", ["cr", var.application, var.environment])

    # networking
    azurerm_virtual_network        = join("-", ["vnet", var.application, var.environment])
    azurerm_subnet                 = join("-", ["subnet", var.application, var.environment])
    azurerm_network_security_group = join("-", ["nsg", var.application, var.environment])
    azurerm_public_ip              = join("-", ["pip", var.application, var.environment])
    azurerm_dns_cname_record       = "${var.application}"
    azurerm_dns_txt_record         = "asuid.${var.application}"

    # security / identity
    azurerm_key_vault              = join("-", ["kv", var.application, var.environment])
    azurerm_user_assigned_identity = join("-", ["id", var.application, var.environment])

    # storage / data
    azurerm_storage_account = join("", ["st", var.application, var.environment])

    # monitoring
    azurerm_log_analytics_workspace = join("-", ["log", var.application, var.environment])
    azurerm_application_insights    = join("-", ["appi", var.application, var.environment])
  }
}
