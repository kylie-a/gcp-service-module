# General variables

variable project {
  description = "Project ID to use."
  default     = ""
}

variable service_name {

}
variable region {
  default = "us-central1"
}

variable "dns" {
  description = "List of DNS records to add for your service."
  type        = "list"
  default     = []
}

variable "datastore" {
  type    = "map"
  default = {}
}

variable "pubsub" {
  type = "map"
  default = {}
}

variable "cloud_sql" {
  type = "map"
  default = {}
}

variable "iam" {
  type = "map"
  default = {}
}
