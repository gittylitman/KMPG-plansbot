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
  protocol              = "HTTPS"
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

resource "google_compute_region_ssl_certificate" "default" {
  name   = var.cert_name
  region   = var.region
  private_key = file(var.private_key_file)
  certificate =  file(var.cert_file)

  lifecycle {
    create_before_destroy = true
  }
}

data "google_compute_subnetwork" "proxy_subnet" {
  name          = var.subnet_proxy_name
  region        = var.region
  project = var.host_project_id
}

resource "google_compute_region_target_https_proxy" "https_proxy" {
  name            = var.https_proxy_name
  region          = var.region
  url_map         = google_compute_region_url_map.url_map.id
  ssl_certificates = [data.google_compute_region_ssl_certificate.ca_cert.id]
}

resource "google_compute_forwarding_rule" "https_forwarding_rule" {
  name                  = var.https_forwarding_rule_name
  region                = var.region
  load_balancing_scheme = "INTERNAL_MANAGED"
  target                = google_compute_region_target_https_proxy.https_proxy.self_link
  port_range            = "443"
  network               = data.google_compute_network.vpc_network.name
  subnetwork            = data.google_compute_subnetwork.subnetwork[2].name
  depends_on = [ data.google_compute_subnetwork.proxy_subnet ]
}
