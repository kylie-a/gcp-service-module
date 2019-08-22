resource "google_dns_record_set" "dns_record" {
  count        = "${length(var.dns)}"
  name         = "${var.dns.*.name}.${var.dns.*.managed_zone_dns}"
  type         = "CNAME"
  ttl          = 300
  managed_zone = "${var.dns.*.managed_zone_name}"
  rrdatas      = ["${var.ingress_dns}.${var.dns.*.managed_zone_dns}"]
}

module "iam" {
  source = "./modules/iam"
  project = "${var.project}"
  service_name = "${var.service_name}"
  roles = "${var.iam.roles}"
}

module "pubsub_subscriptions" {
  source       = "./modules/pubsub/subscriber"
  service_name = "${var.service_name}"
  project = "${var.project}"
  topics = "${var.pubsub.subscriptions}"
  ack_deadline_timeout = "${var.pubsub.ack_deadline_timeout}"
}

module "pubsub_publishes_to" {
  source = "./modules/pubsub/publisher"
  service_name = "${var.service_name}"
  project = "${var.project}"
  topics = "${var.pubsub.publishes_to}"
}

module "cloud_sql" {
  source = "./modules/cloudSQL"
  service_name = "${var.service_name}"
  project = "${var.project}"
  region = "${var.region}"
  
  db_version = "${var.cloud_sql.db_version}"
  tier = "${var.cloud_sql.tier}"
  binary_log_enabled = "${var.cloud_sql.binary_log_enabled}"
  backup_enabled = "${var.cloud_sql.backup_enabled}"
  start_time = "${var.cloud_sql.start_time}"
  db_name = "${var.cloud_sql.db_name}"
  users = "${var.cloud_sql.users}"
}

