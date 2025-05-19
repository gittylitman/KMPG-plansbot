resource "google_compute_address" "psc_ip" {
  name         = "psc-ip"
  address_type = "INTERNAL"
  region       = "me-west1"
  subnetwork   = data.google_compute_subnetwork.subnetwork[2].name
}

resource "google_compute_forwarding_rule" "psc_google_apis" {
  name                  = "pscpmo" 
  region                = "me-west1"
  network               = data.google_compute_network.vpc_network.id
  subnetwork            = data.google_compute_subnetwork.subnetwork_psc.id
  ip_address            = google_compute_address.psc_ip.id
  load_balancing_scheme = "INTERNAL"
  ports                 = ["443"]
  target                = "all-apis"
}