terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

resource "google_compute_network" "vpc" {
  name                    = "gke-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "gke-subnet"
  ip_cidr_range = "10.10.10.0/24"
  network       = google_compute_network.vpc.self_link
  region        = var.gcp_region
}

module "gke_cluster" {
  source       = "./modules/gke"
  cluster_name = var.gke_cluster_name
  location     = var.gcp_region
  node_count   = 1
}
