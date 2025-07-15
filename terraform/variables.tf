variable "gcp_project" {
  description = "The GCP project ID."
  type        = string
}

variable "gcp_region" {
  description = "The GCP region to create resources in."
  type        = string
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}