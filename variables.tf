# General variables

variable "project" {
  description = "Project ID to use."
  default     = ""
}

variable "service_name" {
}

variable "region" {
  default = "us-central1"
}

variable "dns" {
  description = "List of DNS records to add for your service."
  type        = list(string)
  default     = []
}

variable "datastore" {
  type    = map(string)
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
  type    = map(string)
  default = {}
}

