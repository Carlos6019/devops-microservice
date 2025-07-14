# Main Terraform Configuration - Basic EKS Cluster for Testing
# Simplified version using AWS defaults

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = var.aws_region
}

# Call EKS Module
module "eks" {
  source = "./module/aws/eks"
  
  # Cluster Configuration
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  
  # Node Group Configuration
  node_group_desired_size = var.node_group_desired_size
  node_group_max_size     = var.node_group_max_size
  node_group_min_size     = var.node_group_min_size
  node_group_instance_types = var.node_group_instance_types
}


