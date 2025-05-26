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
    default = [ "nec-plan-compute-back" , "nec-plan-compute-front" ]
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
    type = string
    default = "pmo-chat-gcp-prod"
}

variable "container_image" {
    type = string
    default = "us-docker.pkg.dev/cloudrun/container/hello"
}

# Firestore resource

variable "firestore_database_name" {
    type = string
    default = "plansbot-new"
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

# load balancer

variable "neg_name" {
    type = string
    default = "front1"
}

variable "backend_service_name" {
    type = string
    default = "front1"
}

variable "lb_name" {
    type = string
    default = "lb"
}

variable "cert_name" {
    type = string
    default = "cert"
}

variable "private_key_file" {
    type = string
    default = "./private_key.pem"
}

variable "cert_file" {
    type = string  
    default = "./certificate.pem"
}

variable "https_proxy_name" {
    type = string
    default = "https-proxy"
}

variable "https_forwarding_rule_name" {
    type = string
    default = "https-rule"
}

# Private service connect resource

variable "internal_ip_name" {
  type = string
  default = "ip-name"
}

variable "ip_address" {
  type = string
  default = "10.0.1.0/26"
}

variable "psc_endpoint_name" {
  type = string
  default = "psc"
}

variable "googleapis_zone_name" {
  type = string
  default = "zone"
}

variable "google_api_hostnames_for_psc" {
  type = list(string)
  default = [ "europe-west1-aiplatform.googleapis.com.", "europe-west1-aiplatform.p.googleapis.com.", "firestore.googleapis.com.", "me-west1-aiplatform.googleapis.com." ]
}
