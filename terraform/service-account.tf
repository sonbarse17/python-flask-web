resource "google_service_account" "gke_service_account" {
  account_id   = "gke-terraform-sa"
  display_name = "GKE Terraform Service Account"
  project      = var.gcp_project
}

resource "google_project_iam_member" "gke_sa_roles" {
  for_each = toset([
    "roles/compute.networkAdmin",
    "roles/container.admin",
    "roles/iam.serviceAccountUser"
  ])
  
  project = var.gcp_project
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}