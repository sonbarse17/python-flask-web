
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
