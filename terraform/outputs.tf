output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = module.gke_cluster.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the GKE cluster's Kubernetes API server."
  value       = module.gke_cluster.cluster_endpoint
}