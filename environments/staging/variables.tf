variable "env" {
    description = "The environment to deploy to"
    type = string
}

variable "web_app_name" {
    description = "Web app name"
    type = string
    default = "web-app"
}

variable "bastion_app_name" {
    description = "Bastion app name"
    type = string
    default = "bastion-app"
}

variable "vpc_app_name" {
    description = "VPC app name"
    type = string
    default = "vpc-app"
}

variable "project_id" {
    description = "Project ID"
    type = string
    default = "stay-364123"
}

variable "location" {
    description = "Location to serve the app from"
    type = string
    default = "europe-west1"
}