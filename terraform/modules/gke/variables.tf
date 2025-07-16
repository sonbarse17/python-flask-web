
variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the GKE cluster."
  type        = number
  default     = 1
}

variable "network_id" {
  description = "The ID of the VPC network."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to use for the GKE nodes."
  type        = string
}
