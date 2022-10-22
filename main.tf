# SERVICES
module "service" {
  source     = "./modules/service"
  project_id = var.project_id

  for_each   = toset(local.services)
  service_id = each.key
}

# IAM
module "iam" {
  source             = "./modules/iam"
  project_id         = var.project_id
  service_account_id = "${var.service_account_id}-${var.env}"
  role               = var.role

  depends_on = [
    module.service
  ]
}

# INSTANCES
module "web-api" {
  source        = "./modules/api"
  project_id    = var.project_id
  region        = var.region
  database_type = "CLOUD_FIRESTORE"
  env           = var.env
  repository_id = "${var.repository_id}-${var.env}"
  location      = var.location

  depends_on = [
    module.service
  ]
}

# FIREWALL
module "web-firewall" {
  source       = "./modules/firewall"
  source_range = "*"
  action       = "ALLOW"
  description  = "Allow all IPs to access this resource"
  priority     = 1000
  project_id   = module.web-api.project

  depends_on = [
    module.service
  ]
}

# DATABASE
module "nosql-database" {
  source     = "./modules/firebase"
  project_id = var.project_id
  location   = "EU"
  env        = var.env

  depends_on = [
    module.service
  ]
}

