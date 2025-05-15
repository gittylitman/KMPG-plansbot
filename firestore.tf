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

resource "google_firestore_database" "firestore_database" {
  project = var.project_id
  name                              = var.firestore_database_name
  location_id                       = var.location
  type                              = "FIRESTORE_NATIVE"
  app_engine_integration_mode       = "DISABLED"
  deletion_policy                   = "DELETE"
  depends_on = [
    google_project_service.cloudresourcemanager,
    google_project_service.firestore
  ]
}

resource "google_firestore_document" "documents"{
  project = var.project_id
  database = google_firestore_database.firestore_database.name
  collection = var.table_name[count.index]
  document_id = var.table_name[count.index]
  fields = ""
  count = length(var.table_name)
}
