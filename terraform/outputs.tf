
output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster's Kubernetes API server."
  value       = module.eks_cluster.cluster_endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks_cluster.cluster_name
}

output "cluster_ca_certificate" {
  description = "The base64 encoded certificate data required to communicate with the cluster."
  value       = module.eks_cluster.cluster_ca_certificate
}
