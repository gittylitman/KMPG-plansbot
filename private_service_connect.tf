resource "google_compute_address" "psc_ip" {
  name         = "psc-ip"
  address_type = "INTERNAL"
  region       = "me-west1"
  subnetwork   = google_compute_subnetwork.psc_subnet.id
}

resource "google_compute_forwarding_rule" "psc_google_apis" {
  name                  = "pscpmo" 
  region                = "me-west1"
  network               = google_compute_network.vpc_network.id
  subnetwork            = google_compute_subnetwork.subnetwork_psc.id
  ip_address            = google_compute_address.psc_ip.id
  load_balancing_scheme = "INTERNAL"
  ports                 = ["443"]
  target                = "all-apis"
}