resource "google_sql_database_instance" "master" {
  count = "${length(var.cloud_sql.db_name)}"
  name = "${var.service_name}-db-master"
  database_version = "${var.cloud_sql.db_version}"
  region = "${var.region}"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "${var.cloud_sql.tier}"
    backup_configuration = {
      binary_log_enabled = "${var.cloud_sql.binary_log_enabled}"
      enabled = "${var.cloud_sql.backup_enabled}"
      start_time = "${var.cloud_sql.start_time}"
    }
  }
}

resource "google_sql_database" "database" {
  count = "${length(var.cloud_sql.db_name)}"
  name      = "${var.cloud_sql.db_name}"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
}

resource "google_sql_user" "users" {
  count    = "${length(var.cloud_sql.users)}"
  name     = "${var.cloud_sql[count.index]}"
  instance = "${google_sql_database_instance.master.name}"
}