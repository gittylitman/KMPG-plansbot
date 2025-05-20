# resource "google_compute_address" "psc_ip" {
#   name         = "psc-ip"
#   region       = "me-west1"
#   subnetwork   = data.google_compute_subnetwork.subnetwork[2].name
#   address_type = "INTERNAL"
# }

# resource "google_compute_forwarding_rule" "psc_google_apis" {
#   name                  = "pscpmo" 
#   region                = "me-west1"
#   load_balancing_scheme = ""
#   target                = "all-apis"
#   network               = data.google_compute_network.vpc_network.id
#   ip_address            = google_compute_address.psc_ip.id
# }

  
resource "google_compute_global_address" "psc_internal_ip" {
  project      = var.project_id
  name         = "endpoint-ip" # שם לכתובת, למשל pscpmo-ip
  address_type = "INTERNAL"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = data.google_compute_network.vpc_network.id
  address      = "10.0.7.5" # הכתובת IP הספציפית שאת רוצה
}

resource "google_compute_global_forwarding_rule" "psc_endpoint" {
  project               = var.project_id
  name                  = "pscpmo"
  target                = "all-apis"
  network               = data.google_compute_network.vpc_network.id
  ip_address            = google_compute_global_address.psc_internal_ip.self_link
  load_balancing_scheme = "" 
  ip_protocol           = "TCP" 
}

resource "google_dns_managed_zone" "private_googleapis_zone" {
  project     = var.project_id
  name        = "googleapis-com-private-zone" 
  dns_name    = "googleapis.com."           
  description = "Private DNS zone for googleapis.com to route via PSC"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url = data.google_compute_network.vpc_network.id
    }
  }
}

resource "google_dns_record_set" "wildcard_googleapis_a_record" {
  project      = var.project_id
  managed_zone = google_dns_managed_zone.private_googleapis_zone.name
  name         = "*.googleapis.com." 
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_global_address.psc_internal_ip.address]
}