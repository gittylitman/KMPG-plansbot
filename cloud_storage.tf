resource "google_storage_bucket" "bucket" {
  project = var.project_id
  name = var.cloud_storage_name
  location = var.location
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  logging {
    log_bucket = var.log_bucket_name
    log_object_prefix = "logs/"
  }
}
