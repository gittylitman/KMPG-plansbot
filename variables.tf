variable "project_id" {
  type = string
  default = "kpmg-plansbot"
}

variable "location" {
  type = string
  default = "me-west1"
}

# Firestore resource

variable "firestore_database_name" {
  type = string
  default = "kpmg"
}

variable "table_names" {
    type = list(string)
    default = [ "kpmg" ]
}

# Cloud storage resource

variable "cloud_storage_name" {
  type = string
  default = "kpmg"
}

variable "log_bucket_name" {
  type = string
  default = "kpmg"
}
