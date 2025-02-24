# Artifact Registry Repository
resource "google_artifact_registry_repository" "repository" {
  provider      = google-beta
  location      = var.region
  repository_id = var.service_name
  format        = "DOCKER"
}
resource "google_cloud_run_v2_service" "demo_service" {
  name     = var.service_name
  location = var.region
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        env {
            name  = "PROJECT_ID"
            value = var.project_id
        }
        env {
            name  = "REGION"
            value = var.region
        }   
        env {
            name  = "BUCKET_NAME"
            value = var.bucket_name
        }
    }
    service_account = google_service_account.service_account.email
    
    
  }


}

resource "google_service_account" "service_account" {
  account_id   = "${var.service_name}-sa"
  display_name = "Service account for ${var.service_name}"
}

/*
resource "google_cloud_run_service_iam_binding" "invoker" {
  location    = google_cloud_run_service.service.location
  project     = google_cloud_run_service.service.project
  service     = google_cloud_run_service.service.name
  role        = "roles/run.invoker"
  members     = ["allUsers"]
}


output "url" {
  value = google_cloud_run_v2_service.service.status[0].url
}

output "service_account" {
  value = google_service_account.service_account.email
}
*/

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
   location    = google_cloud_run_v2_service.demo_service.location
   project     = google_cloud_run_v2_service.demo_service.project
   service     = google_cloud_run_v2_service.demo_service.name

   policy_data = data.google_iam_policy.noauth.policy_data
}
/*
output "url" {
  value = google_cloud_run_v2_service.demo_service.status[0].url
}*/

output "service_account" {
  value = google_service_account.service_account.email
}