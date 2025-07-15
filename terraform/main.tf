
provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "eks_cluster" {
  source  = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = data.aws_subnets.default.ids
  instance_types  = var.instance_types
  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
}
