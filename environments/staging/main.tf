# INSTANCES
module "web-api" {
    source = "../../modules/api"
    project_id = var.project_id
    location = var.location
}

module "web-front" {
    source = "../../modules/front"
    name = "Front-end web application"
    location = var.location
}

# FIREWALL
module "firewall-web" {
    source = "../../modules/firewall"
    source_range = "*"
    action       = "ALLOW"
    description  = "Allow all IPs to access this resource"
    priority     = 1000
}

/* ---- */


