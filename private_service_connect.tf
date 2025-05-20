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

# כתובת פנימית עבור PSC
resource "google_compute_global_address" "psc_google_apis" {
  name          = "psc-google-apis"
  purpose       = "PRIVATE_SERVICE_CONNECT"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = data.google_compute_network.vpc_network.name
}

# Forwarding rule ל-Google APIs (כולל Vertex AI)
resource "google_compute_forwarding_rule" "psc_google_apis" {
  name                  = "psc-google-apis"
  load_balancing_scheme = "INTERNAL"
  target                = "all-apis" 
  network               = data.google_compute_network.vpc_network.name
  ip_address            = google_compute_global_address.psc_google_apis.id
  ports                 = ["443"]
  allow_psc_global_access = false
}