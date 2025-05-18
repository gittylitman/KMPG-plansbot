resource "google_storage_bucket" "storage_bucket" {
  project = var.project_id
  name = var.cloud_storage_name
  location = var.region
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  logging {
    log_bucket = var.log_bucket_name
    log_object_prefix = "logs/"
  }
}
