output "id" {
  description = "An identifier for the resource with format {{project}}."
  value       = google_app_engine_application.web_api.id
}

output "name" {
  description = "Unique name of the app, usually apps/{PROJECT_ID}."
  value       = google_app_engine_application.web_api.name
}

output "app_id" {
  description = "Identifier of the app, usually {PROJECT_ID}."
  value       = google_app_engine_application.web_api.app_id
}

output "project" {
  description = "Project ID of the application."
  value       = google_app_engine_application.web_api.project
}
