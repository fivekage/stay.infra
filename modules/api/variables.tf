variable "env" {
  description = "Environment"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "auth_domain" {
  description = "(Optional) The domain to authenticate users with when using App Engine's User API."
  type        = string
  default     = null
}

variable "database_type" {
  description = "(Optional) The type of the Cloud Firestore or Cloud Datastore database associated with this application. Can be `CLOUD_FIRESTORE` or `CLOUD_DATASTORE_COMPATIBILITY` for new instances."
  type        = string
  default     = null

  validation {
    condition     = var.database_type == null || contains(["CLOUD_FIRESTORE", "CLOUD_DATASTORE_COMPATIBILITY"], var.database_type == null ? "" : var.database_type)
    error_message = "The database type must be one of [CLOUD_FIRESTORE, CLOUD_DATASTORE_COMPATIBILITY]."
  }
}

variable "serving_status" {
  description = "(Optional) The serving status of the app."
  type        = string
  default     = null

  validation {
    condition     = var.serving_status == null || contains(["UNSPECIFIED", "SERVING", "USER_DISABLED", "SYSTEM_DISABLED"], var.serving_status == null ? "" : var.serving_status)
    error_message = "The serving status of the app must be one of [UNSPECIFIED, SERVING, USER_DISABLED, SYSTEM_DISABLED]."
  }
}
variable "region" {
  description = "Location where region store bucket"
  type        = string
}

variable "location" {
  description = "Location to serve the app from"
  type        = string
}

variable "repository_id" {
  description = "Repository ID"
  type        = string
}
