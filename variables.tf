# General variables

variable "project" {
  description = "Project ID to use."
  default     = ""
}

variable "service_name" {
  default = ""
}

variable "region" {
  default = "us-central1"
}

variable "dns" {
  type = list(object({
    name              = string
    managed_zone_name = string
    managed_zone_dns  = string
  }))
  default = []
}

variable "datastore" {
  type = map(object({
  }))
  default = {}
}

variable "pubsub" {
  type    = map(string)
  default = {}
}

variable "cloud_sql" {
  type    = map(string)
  default = {}
}

variable "iam" {
  type = map(object({
    roles = list(string)
  }))
  default = {}
}

