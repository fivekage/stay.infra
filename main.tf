# PROJECT

module "google-project" {
  source          = "./modules/project"
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account
  skip_delete     = true
}

# INSTANCES
module "web-api" {
  source        = "./modules/api"
  project_id    = module.google-project.id
  region        = var.region
  database_type = "CLOUD_DATASTORE_COMPATIBILITY"
}

module "web-front" {
  source    = "./modules/front"
  name      = "web-front"
  location  = var.location
  image_url = var.image_url
}

# FIREWALL
module "firewall-web" {
  source       = "./modules/firewall"
  source_range = "*"
  action       = "ALLOW"
  description  = "Allow all IPs to access this resource"
  priority     = 1000
  project_id   = module.google-project.id
}

# DATABASE
module "nosql-database" {
  source     = "./modules/firebase"
  project_id = var.project_id
}

