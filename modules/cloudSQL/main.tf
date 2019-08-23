resource "google_sql_database_instance" "master" {
  count = "${var.enabled}"
  name = "${var.service_name}-db-master"
  database_version = "${var.db_version}"
  region = "${var.region}"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "${var.tier}"
    backup_configuration {
      binary_log_enabled = "${var.binary_log_enabled}"
      enabled = "${var.backup_enabled}"
      start_time = "${var.start_time}"
    }
  }
}

resource "google_sql_database" "database" {
  count = "${var.enabled}"
  name      = "${var.db_name}"
  instance  = "${google_sql_database_instance.master.*.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
}

resource "google_sql_user" "users" {
  count    = "${length(var.users)}"
  name     = "${var.users[count.index]}"
  instance = "${google_sql_database_instance.master.*.name}"
}