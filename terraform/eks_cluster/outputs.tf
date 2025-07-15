
output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster's Kubernetes API server."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_ca_certificate" {
  description = "The base64 encoded certificate data required to communicate with the cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
