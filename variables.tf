variable "project_id" {
  type = string
}

variable "location" {
  type = string
}

# Firestore resource

variable "firestore_database_name" {
  type = string
}

variable "table_names" {
    type = list(string)
}

# Cloud storage resource

variable "cloud_storage_name" {
  type = string
}

variable "log_bucket_name" {
  type = string
}
