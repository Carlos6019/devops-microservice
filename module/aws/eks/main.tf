# EKS Module - Basic EKS Cluster for Testing
# Ultra-simplified version - AWS creates everything automatically

# Data sources
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# Use default VPC
data "aws_vpc" "default" {
  default = true
}

# Get default subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# EKS Cluster - AWS creates IAM roles automatically
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids              = data.aws_subnets.default.ids
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  tags = {
    Name = var.cluster_name
  }
}

# EKS Node Group - AWS creates IAM roles automatically
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-node-group"
  subnet_ids      = data.aws_subnets.default.ids

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  instance_types = var.node_group_instance_types

  tags = {
    Name = "${var.cluster_name}-node-group"
  }
}


