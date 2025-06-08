resource "google_storage_bucket" "storage_bucket" {
  project = var.project_id
  name = "${var.project_name}-gcs-${var.environment}"
  location = var.region
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  logging {
    log_bucket = "${var.project_name}-gcs-log-${var.environment}"
    log_object_prefix = "logs/"
  }
}
