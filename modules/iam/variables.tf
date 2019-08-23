variable "project" {}

variable "service_name" {}

variable "roles" {
  default = []
  type = "list(string)"
}