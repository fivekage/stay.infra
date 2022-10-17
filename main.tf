# INSTANCES
module "web-api" {
  source        = "./modules/api"
  project_id    = var.project_id
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
  project_id   = var.project_id
}

# DATABASE
module "nosql-database" {
  source     = "./modules/firebase"
  project_id = var.project_id
}

