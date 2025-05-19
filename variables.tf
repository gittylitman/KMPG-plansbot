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
    default = ["nec-plan-compute-back", "nec-plan-compute-preprocess", "nec-plan-compute-front"]
}

# front cloud run

variable "front_cloud_run_name"{
    type = string
}

variable "front_container_image" {
    type = string
}

# cloud run

variable "cloud_run_names"{
    type = list(string)
}

variable "container_image" {
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

# load balancer

variable "neg_name" {
    type = string
    default = "front"
}

variable "backend_service_name" {
    type = string
    default = "front"
}

variable "lb_name" {
    type = string
    default = "lb-dev"
}

variable "cert_name" {
    type = string
    default = "name"
}

variable "private_key_file" {
    type = string
    default = "./private_key.pem"
}

variable "cert_file" {
    type = string
    default = "./certificate.pem"
  
}

variable "subnet_proxy_name" {
    type = string
    default = "nec-plan-compute-proxy"
}

variable "https_proxy_name" {
    type = string
    default = "https-proxy"
}

variable "https_forwarding_rule_name" {
    type = string
    default = "https-rule"
}