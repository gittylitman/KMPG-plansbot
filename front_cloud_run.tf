resource "google_cloud_run_v2_service" "front_cloudrun" {
  name     = var.front_cloud_run_name
  location = var.region
  ingress =  "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"
  deletion_protection = false

  template {
    containers {
      ports {
        container_port = 80
      }
      image = var.front_container_image
    }

    vpc_access {
      network_interfaces {
        network = data.google_compute_network.vpc_network.name
        subnetwork = data.google_compute_subnetwork.subnetwork[2]
        tags = []
      }
    }
  }
  depends_on = [ google_project_service.cloud_run,
                 google_compute_subnetwork.subnetwork ]
}

resource "google_cloud_run_service_iam_member" "allow_unauthenticated_front_cloud_run" {
  service = google_cloud_run_v2_service.front_cloudrun.name
  location = google_cloud_run_v2_service.front_cloudrun.location
  role    = "roles/run.invoker"
  member  = "allUsers"
}
