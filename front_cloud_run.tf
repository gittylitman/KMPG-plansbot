resource "google_cloud_run_v2_service" "front_cloudrun" {
  name     = "${var.project_name}-front-crun-${var.environment}"
  location = var.region
  ingress =  "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"
  deletion_protection = false

  template {
    containers {
      image = var.front_container_image
    }

    vpc_access {
      network_interfaces {
        network = data.google_compute_network.vpc_network.name
        subnetwork = data.google_compute_subnetwork.subnetwork[1].name
        tags = []
      }
      egress = "ALL_TRAFFIC"
    }
    service_account = data.google_service_account.cloudrun_service_account.email
  }
  depends_on = [ google_project_service.cloud_run ]
}

resource "google_cloud_run_service_iam_member" "allow_unauthenticated_front_cloud_run" {
  service = google_cloud_run_v2_service.front_cloudrun.name
  location = google_cloud_run_v2_service.front_cloudrun.location
  role    = "roles/run.invoker"
  member  = "allUsers"
}
