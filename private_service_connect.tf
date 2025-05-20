resource "google_compute_global_address" "psc_internal_ip" {
  project      = var.project_id
  name         = var.internal_ip_name
  address_type = "INTERNAL"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = data.google_compute_network.vpc_network.id
  address      = var.ip_address
}

resource "google_compute_global_forwarding_rule" "psc_endpoint" {
  project               = var.project_id
  name                  = var.psc_endpoint_name
  target                = "all-apis"
  network               = data.google_compute_network.vpc_network.id
  ip_address            = google_compute_global_address.psc_internal_ip.self_link
  load_balancing_scheme = "" 
}

resource "google_dns_managed_zone" "private_googleapis_zone" {
  project     = var.project_id
  name        = var.googleapis_zone_name
  dns_name    = "googleapis.com."           
  description = "Private DNS zone for googleapis.com to route via PSC"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url = data.google_compute_network.vpc_network.id
    }
  }

  depends_on = [ google_project_service.dns ]
}

resource "google_dns_record_set" "wildcard_googleapis_a_record" {
  project      = var.project_id
  managed_zone = google_dns_managed_zone.private_googleapis_zone.name
  name         = var.google_api_hostnames_for_psc[count.index]
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_global_address.psc_internal_ip.address]
  count        = length(var.google_api_hostnames_for_psc)
}