resource "google_compute_region_network_endpoint_group" "serverless_neg" {
  name                  = var.neg_name
  region                = var.region
  network_endpoint_type = "SERVERLESS"
  cloud_run {
    service = google_cloud_run_v2_service.front_cloudrun.name
  }
}

resource "google_compute_region_backend_service" "backend_service" {
  name                  = var.backend_service_name
  region                = var.region
  load_balancing_scheme = "INTERNAL_MANAGED"
  protocol              = "HTTP"
  backend {
    group = google_compute_region_network_endpoint_group.serverless_neg.id
  }
}

resource "google_compute_region_url_map" "url_map" {
  name   = var.lb_name
  region = var.region
  default_service = google_compute_region_backend_service.backend_service.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "path-matcher"
  }

  path_matcher {
    name = "path-matcher"
    default_service = google_compute_region_backend_service.backend_service.id
  }
}

resource "google_compute_region_target_http_proxy" "http_proxy" {
  name            = var.http_proxy_name
  region          = var.region
  url_map         = google_compute_region_url_map.url_map.id
}

resource "google_compute_forwarding_rule" "http_forwarding_rule" {
  name                  = var.http_forwarding_rule_name
  region                = var.region
  load_balancing_scheme = "INTERNAL_MANAGED"
  target                = google_compute_region_target_http_proxy.http_proxy.self_link
  port_range            = "80"
  network               = data.google_compute_network.vpc_network.name
  subnetwork            = data.google_compute_subnetwork.subnetwork[2].name
}
