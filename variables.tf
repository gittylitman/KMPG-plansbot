variable "project_id" {
    type = string
}

variable "host_project_id" {
    type = string
}

variable "region" {
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

variable "front_cloud_run_name"{
    type = string
}

variable "front_container_image" {
    type = string
}

# cloud run

variable "cloud_run_name"{
    type = string
}

variable "container_image" {
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

# load balancer

variable "neg_name" {
    type = string
}

variable "backend_service_name" {
    type = string
}

variable "lb_name" {
    type = string
}

variable "http_proxy_name" {
    type = string
}

variable "http_forwarding_rule_name" {
    type = string
}

# Private service connect resource

variable "internal_ip_name" {
  type = string
}

variable "ip_address" {
  type = string
}

variable "psc_endpoint_name" {
  type = string
}

variable "googleapis_zone_name" {
  type = string
}

variable "google_api_hostnames_for_psc" {
  type = list(string)
  default = [ "europe-west1-aiplatform.googleapis.com.", "europe-west1-aiplatform.p.googleapis.com.", "firestore.googleapis.com.", "me-west1-aiplatform.googleapis.com." ]
}