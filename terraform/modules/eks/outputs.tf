output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API server."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "The base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}
