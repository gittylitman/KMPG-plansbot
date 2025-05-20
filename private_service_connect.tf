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


resource "google_compute_forwarding_rule" "psc_google_apis" {
  name                  = "psc-google-apis"
  region                = var.region
  network               = data.google_compute_network.vpc_network.id
  subnetwork            = data.google_compute_subnetwork.subnetwork[2].name
  load_balancing_scheme = "INTERNAL"
  target                = "all-google-apis"
  ports                 = ["443"]
}