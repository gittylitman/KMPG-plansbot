terraform {
  backend "gcs" {
    bucket  = "state-plansbot"
    prefix  = "state"
  }
}

provider "google" {
  project = var.project_id
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloud_run" {
  project = var.project_id
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  project = var.project_id
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
  disable_on_destroy = false 
}

resource "google_project_service" "dns" {
  project = var.project_id
  service = "dns.googleapis.com"
  disable_on_destroy = false 
}

resource "google_project_iam_binding" "binding_project" {
  project = var.host_project_id
  role = "roles/compute.networkUser"
  members = [
      "serviceAccount:service-${data.google_project.project.number}@serverless-robot-prod.iam.gserviceaccount.com",
  ]
  depends_on = [ google_project_service.iam ]
}

data "google_service_account" "cloudrun_service_account" {
  project = var.project_id
  account_id = var.service_account_name
  depends_on = [ google_project_service.iam ]
}
