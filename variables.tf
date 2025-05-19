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
    default = "pmo-front-gcp-prod"
}

variable "front_container_image" {
    type = string
    default = "us-docker.pkg.dev/cloudrun/container/hello"
}

# cloud run

variable "cloud_run_name"{
    type = list(string)
    default = ["pmo-chat-gcp-prod","pmo-preprocess-gcp-prod"]
}

variable "container_image" {
    type = list(string)
    default = ["us-docker.pkg.dev/cloudrun/container/hello","us-docker.pkg.dev/cloudrun/container/hello"]
}

# Firestore resource

variable "firestore_database_name" {
    type = string
    default = "firestore-plansbot1"

}

variable "table_names" {
    type = list(string)
    default = [ "TA1","TB1" ]
}

# Cloud storage resource

variable "cloud_storage_name" {
    type = string
    default = "csplans1"
}

variable "log_bucket_name" {
    type = string
    default = "lbpalns1"
}
