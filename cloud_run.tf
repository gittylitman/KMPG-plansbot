data "google_service_account" "cloudrun_service_account" {
  account_id = var.service_account_name
  depends_on = [ google_project_service.iam ]
}

resource "google_cloud_run_v2_service" "cloud_run"{
  name = var.cloud_run_name[count.index]
  location = var.location
  ingress = "INGRESS_TRAFFIC_INTERNAL_ONLY"
  deletion_protection = false

  template {
    containers {
      image = var.container_image[count.index]
    }

    vpc_access {
      network_interfaces {
        network = var.network_name
        subnetwork = var.subnetwork_name[count.index]
        tags = []
      }
    }
    service_account = data.google_service_account.cloudrun_service_account.email
  }
  count = length(var.cloud_run_name)
  depends_on = [ google_project_service.cloud_run ]
}

resource "google_cloud_run_service_iam_member" "allow_unauthenticated_cloud_run" {
  service = var.cloud_run_name[count.index]
  location = google_cloud_run_v2_service.cloud_run.location
  role    = "roles/run.invoker"
  member  = "allUsers"
  count = length(var.cloud_run_name)
  depends_on = [ google_cloud_run_v2_service.cloud_run ]
}
