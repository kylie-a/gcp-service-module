variable "topics" {
  default = []
}

variable "service_name" {}

variable "project" {}

resource "google_pubsub_topic_iam_member" "sre_publisher" {
  count = "${length(var.topics)}"
  topic = "${var.topics[count.index]}"
  role         = "roles/pubsub.publisher"
  member       = "serviceAccount:${var.service_name}-svc-acct@${var.project}.iam.gserviceaccount.com"
}
