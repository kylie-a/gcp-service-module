resource "google_service_account" "sre_service_acct" {
  account_id   = "${var.service_name}-svc-acct"
  display_name = "${var.service_name}-svc-acct"
  project      = "${var.project}"
}

resource "google_project_iam_member" "sre-identity-member" {
  count = "${length(var.roles)}"
  project = "${var.project}"
  role    = "${var.roles[count.index]}"
  member  = "serviceAccount:${var.service_name}-svc-acct@${var.project}.iam.gserviceaccount.com"
}