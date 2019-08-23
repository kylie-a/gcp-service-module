variable "enabled" {
  default = false
}

variable service_name {
  default = "service_name"
}
variable project {
  default = "project"
}
variable region {
  default = "us-central1"
}
variable db_version {
  default = "POSTGRES_9_6"
}
variable tier {
  default = "db-g1-small"
}
variable binary_log_enabled {
  default = false
}
variable backup_enabled {
  default = false
}
variable start_time {
}
variable db_name {
  default = "db_name"
}
variable users {
  default = []
}
