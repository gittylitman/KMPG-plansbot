variable "project_id" {
  type = string
}

variable "location" {
  type = string
}

variable "firestore_database_name" {
  type = string
}

variable "table_names" {
    type = list(string)
}
