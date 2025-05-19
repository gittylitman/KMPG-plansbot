resource "google_cloud_run_v2_service" "cloud_run"{
  name = var.cloud_run_names[count.index]
  location = var.region
  ingress = "INGRESS_TRAFFIC_INTERNAL_ONLY"
  deletion_protection = false

  template {
    containers {
      image = var.container_image[count.index]
    }

    vpc_access {
      network_interfaces {
        network = data.google_compute_network.vpc_network.name
        subnetwork = data.google_compute_subnetwork.subnetwork[count.index].name
        tags = []
      }
      egress = "ALL_TRAFFIC"
    }
    service_account = data.google_service_account.cloudrun_service_account.email
  }
  count = length(var.cloud_run_names)
  depends_on = [ google_project_service.cloud_run ]
}

resource "google_cloud_run_service_iam_member" "allow_unauthenticated_cloud_run" {
  service = google_cloud_run_v2_service.cloud_run[count.index].name
  location = google_cloud_run_v2_service.cloud_run[count.index].location
  role    = "roles/run.invoker"
  member  = "allUsers"
  count = length(var.cloud_run_names)
}
