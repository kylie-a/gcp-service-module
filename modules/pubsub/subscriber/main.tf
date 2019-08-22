variable "topics" {
  default = []
}

variable "service_name" {}

variable "project" {}

variable "ack_deadline_timeout" {
  default = 20
}

resource "google_pubsub_subscription" "service_subscriber" {
  count = "${length(var.topics)}"
  name  = "${var.service_name}-${var.topics[count.index]}-subscription"

  ack_deadline_seconds = "${var.ack_deadline_timeout}"
  topic                = "${var.topics[count.index]}"
}

resource "google_pubsub_subscription_iam_member" "sre_subscriber" {
  count = "${length(var.topics)}"
  subscription = "${var.service_name}-${var.topics[count.index]}-subscription"
  role         = "projects/${var.project}/roles/sre_subscriber_role"
  member       = "serviceAccount:${var.service_name}-svc-acct@${var.project}.iam.gserviceaccount.com"
}
