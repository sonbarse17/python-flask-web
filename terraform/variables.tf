
variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.32"
}

variable "instance_types" {
  description = "The instance types for the EKS node group."
  type        = list(string)
  default     = ["t2.medium"]
}

variable "desired_size" {
  description = "The desired number of worker nodes."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of worker nodes."
  type        = number
  default     = 2
}

variable "min_size" {
  description = "The minimum number of worker nodes."
  type        = number
  default     = 1
}
