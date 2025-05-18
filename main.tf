terraform {
  backend "gcs" {
    bucket  = "state-plansbot"
    prefix  = "state"
  }
}

provider "google" {
  project = var.project_id
}

resource "google_project_service" "iam" {
  project = var.project_id
  service            = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_api_service" "cloud_run" {
  project = var.project_id
  service = "run.googleapis.com"
  disable_on_destroy = false
}