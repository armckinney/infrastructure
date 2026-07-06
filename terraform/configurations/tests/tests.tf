module "containerapp" {
  source = "../../modules/containerapp"

  application     = local.application
  environment     = local.environment
  container_image = "docker.io/hello-world:latest"
  dns_zone = {
    name        = "example.com"
    application = local.application
    environment = local.environment
  }
  organization_email = "test@example.com"
  tags               = module.standardized_tags.tags
}

module "example" {
  source = "../../modules/example"

  directory = "tmp/example"
  file_name = "example.txt"
}

module "standardized_resource_names" {
  source = "../../modules/standardized_resource_names"

  application = local.application
  environment = local.environment
  location    = local.location
}

module "standardized_tags" {
  source = "../../modules/standardized_tags"

  application = local.application
  environment = var.environment
  owner       = local.owner
}

module "static_web_app" {
  source = "../../modules/static_web_app"

  application         = local.application
  environment         = var.environment
  resource_group_name = "${local.application}-rg"
  location            = "East US 2"
  tags                = module.standardized_tags.tags
}

module "azure_account" {
  source = "../../modules/azure_account"

  application = local.application
  environment = var.environment
  owner       = local.owner
  location    = local.location
  tags        = module.standardized_tags.tags
}

module "azure_subscription" {
  source = "../../modules/azure_subscription"

  application           = local.application
  environment           = var.environment
  owner                 = local.owner
  location              = local.location
  tags                  = module.standardized_tags.tags
  budget_amount         = 500
  budget_contact_emails = ["alert@example.com"]
  vnet_address_space    = "10.1.0.0/16"
  subnets = {
    public  = "10.1.1.0/24"
    private = "10.1.2.0/24"
  }
}
