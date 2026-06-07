locals {
  common_labels = {
    project     = "counail"
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "google_project_service" "enabled" {
  for_each = toset(var.enabled_services)

  project = var.project_id
  service = each.value

  disable_on_destroy = false
}

resource "google_artifact_registry_repository" "backend" {
  location      = var.region
  repository_id = var.artifact_registry_repository_id
  description   = "Container images for the Counail backend (Go) service."
  format        = "DOCKER"

  labels = merge(local.common_labels, {
    component = "backend"
  })

  depends_on = [google_project_service.enabled]
}
