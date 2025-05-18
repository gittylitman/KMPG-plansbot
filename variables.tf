variable "project_id" {
  type = string
}

variable "location" {
  type = string
}

variable "network_name"{
  type = string
}

variable "service_account_name"{
  type = string
}

# front cloud run

variable "front_cloud_run_name"{
    type = string
}

variable "front_container_image" {
  type = string
}

variable "front_subnetwork_name"{
  type = string
}

# cloud run

variable "cloud_run_name"{
    type = list(string)
}

variable "container_image" {
  type = list(string)
}

variable "subnetwork_name"{
  type = list(string)
}
