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

variable "service_account_name"{
    type = string
    default = "kpmg-plansblot"
}

# Network resource

variable "vpc_name" {
    type = string
    default = "dev"
}

variable "subnetwork_names" {
    type = list(string)
    default = ["nec-plan-compute-back", "nec-plan-compute-preprocess", "nec-plan-compute-front"]
}

variable "subnetwork_psc_name" {
  type = string
  default = "nec-plan-compute-psc"
}

# front cloud run

variable "front_cloud_run_name"{
    type = string
    default = "pmo-front-gcp-prod-1"
}

variable "front_container_image" {
    type = string
    default = "us-docker.pkg.dev/cloudrun/container/hello"
}

# cloud run

variable "cloud_run_names"{
    type = list(string)
    default = ["pmo-chat-gcp-prod-1","pmo-preprocess-gcp-prod-1"]
}

variable "container_image" {
    type = list(string)
    default = ["us-docker.pkg.dev/cloudrun/container/hello","us-docker.pkg.dev/cloudrun/container/hello"]
}

# Firestore resource

variable "firestore_database_name" {
    type = string
    default = "firestore-plansbot1-1"

}

variable "table_names" {
    type = list(string)
    default = [ "TA111","TB111" ]
}

# Cloud storage resource

variable "cloud_storage_name" {
    type = string
    default = "csplans1-1"
}

variable "log_bucket_name" {
    type = string
    default = "lbpalns1-1"
}

# Private service connect resource

variable "internal_ip_name" {
  type = string
  default = "ipname"
}

variable "ip_address" {
  type = string
  default = "10.0.7.5"
}

variable "psc_endpoint_name" {
  type = string
  default = "psc-endpoint-name"
}

variable "googleapis_zone_name" {
  type = string
  default = "googleapis-zone-name"
}

variable "google_api_hostnames_for_psc" {
  type = list(string)
  default = [ "europe-west1-aiplatform.googleapis.com.", "europe-west1-aiplatform.p.googleapis.com.", "firestore.googleapis.com.", "me-west1-aiplatform.googleapis.com." ]
}