resource "google_app_engine_firewall_rule" "firewall_rule" {
  project      = var.project_id
  source_range = var.source_range
  action       = var.action
  description  = var.description
  priority     = var.priority
}