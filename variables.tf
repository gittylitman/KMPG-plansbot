variable "project_id" {
  type = string
}

variable "host_project_id" {
  type = string
}

variable "region" {
  type = string
}

# Network resource

variable "vpc_name" {
  type = string
}

variable "subnetwork_names" {
  type = list(string)
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
