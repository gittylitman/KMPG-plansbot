terraform {
  backend "gcs" {
    bucket  = "state-plansbot"
    prefix  = "state"
  }
}

provider "google" {
  project = var.project_id
}