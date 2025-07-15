variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the EKS cluster in."
  type        = list(string)
}

variable "instance_types" {
  description = "The instance types for the EKS worker nodes."
  type        = list(string)
}

variable "desired_size" {
  description = "The desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes."
  type        = number
}
