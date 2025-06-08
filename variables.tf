variable "project_id" {
    type = string
}

variable "host_project_id" {
    type = string
}

variable "region" {
    type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "service_account_name"{
    type = string
}

# Network resource

variable "vpc_name" {
    type = string
}

variable "subnetwork_names" {
    type = list(string)
    default = [ "nec-plan-compute-back" , "nec-plan-compute-front" ]
}

# front cloud run

variable "front_container_image" {
    type = string
}

# cloud run

variable "container_image" {
    type = string
}

# Firestore resource

variable "table_names" {
    type = list(string)
}

# Private service connect resource

variable "ip_address" {
  type = string
}

variable "google_api_hostnames_for_psc" {
  type = list(string)
  default = [ "europe-west1-aiplatform.googleapis.com.", "europe-west1-aiplatform.p.googleapis.com.", "firestore.googleapis.com.", "me-west1-aiplatform.googleapis.com." ]
}