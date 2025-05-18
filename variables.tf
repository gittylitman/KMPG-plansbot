variable "project_id" {
  type = string
  default = "kpmg-plansbot"
}

variable "host_project_id" {
  type = string
  default = "kpmg-plansbot"
}

variable "region" {
  type = string
  default = "me-west1"
}

# Network

variable "vpc_name" {
  type = string
  default = "dev"
}

variable "subnetwork_names" {
  type = list(string)
  default = [ "nec-plan-compute-front", "nec-plan-compute-back", "nec-plan-compute-preprocess" ]
}

# Firestore resource

variable "firestore_database_name" {
  type = string
  default = "firestore-plansbot"
}

variable "table_names" {
  type = list(string)
  default = [ "TA","TB" ]
}

# Cloud storage resource

variable "cloud_storage_name" {
  type = string
  default = "csplans"
}

variable "log_bucket_name" {
  type = string
  default = "lbpalns"
}
