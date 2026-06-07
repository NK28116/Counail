locals {
  common_labels = {
    project     = "counail"
    environment = var.environment
    managed_by  = "terraform"
  }
}

# Bootstrap: Service Usage API must be enabled before any other
# google_project_service resource can succeed on a fresh GCP project.
resource "google_project_service" "service_usage" {
  project = var.project_id
  service = "serviceusage.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "enabled" {
  for_each = toset([
    for service in var.enabled_services : service
    if service != "serviceusage.googleapis.com"
  ])

  project = var.project_id
  service = each.value

  disable_on_destroy = false

  depends_on = [google_project_service.service_usage]
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
