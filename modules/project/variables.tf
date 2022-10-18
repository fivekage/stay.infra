variable "name" {
  description = "Project display name"
  type        = string
}

variable "project_id" {
  description = "Location to serve the app from"
  type        = string
}

variable "billing_account" {
  description = "Billing account ID used for project"
  type        = string
}

variable "skip_delete" {
  description = "Allow terraform to destroy resources"
  type        = bool
}
