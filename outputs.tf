# Main Terraform Outputs - Basic Configuration

output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_version" {
  description = "EKS cluster version"
  value       = module.eks.cluster_version
}

output "cluster_status" {
  description = "EKS cluster status"
  value       = module.eks.cluster_status
}

output "vpc_id" {
  description = "Default VPC ID"
  value       = module.eks.vpc_id
}

output "subnet_ids" {
  description = "Default subnet IDs"
  value       = module.eks.subnet_ids
}

output "node_group_name" {
  description = "EKS node group name"
  value       = module.eks.node_group_name
}

output "node_group_status" {
  description = "EKS node group status"
  value       = module.eks.node_group_status
}

output "cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
} 