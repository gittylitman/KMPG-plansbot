variable "project_id" {
  type = string
  default = "kpmg-plansbot"
}

variable "location" {
  type = string
  default = "me-west1"
}

variable "network_name"{
  type = string
  default = "dev"
}

variable "service_account_name"{
  type = string
  default = "kpmg-plansblot"
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

variable "front_subnetwork_name"{
  type = string
  default = "nec-plan-compute-front"
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

variable "subnetwork_name"{
  type = list(string)
  default = ["nec-plan-compute-back", "nec-plan-compute-preprocess"]
}