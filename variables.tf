variable "project_id" {
  type = string
  default = "kpmg-plansbot"
}

variable "location" {
  type = string
  default = "me-west1"
}

variable "firestore_database_name" {
  type = string
  default = "plansbot-db"
}

variable "table_name" {
    type = list(string)
    default = [ "TA", "TB" ]
}
