# PROJECT (Use only if you have a organization)
/** module "google-project" {
  source          = "./modules/project"
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account
  skip_delete     = true
}
**/

# BUCKET
/*module "bucket" {
  source   = "./modules/bucket"
  location = "EU"
}*/

# INSTANCES
module "web-api" {
  source        = "./modules/api"
  project_id    = var.project_id
  region        = var.region
  database_type = "CLOUD_FIRESTORE"
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

