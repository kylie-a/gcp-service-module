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
  type    = map(string)
  default = {}
}

variable "pubsub" {
  type = object({
    subscriptions        = list(string)
    publishes_to         = list(string)
    ack_deadline_timeout = number
  })
  default = {
    subscriptions        = []
    publishes_to         = []
    ack_deadline_timeout = 20
  }
}

variable "cloud_sql" {
  type    = map(string)
  default = {}
}

variable "iam" {
  type = object({
    roles = list(string)
  })
  default = {
    roles = []
  }
}

