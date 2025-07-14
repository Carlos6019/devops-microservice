# EKS Module Outputs - Basic Configuration

output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.main.id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  value       = aws_eks_cluster.main.certificate_authority[0].data
  sensitive   = true
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "cluster_version" {
  description = "EKS cluster version"
  value       = aws_eks_cluster.main.version
}

output "cluster_status" {
  description = "EKS cluster status"
  value       = aws_eks_cluster.main.status
}

output "vpc_id" {
  description = "EKS VPC ID"
  value       = aws_vpc.eks_vpc.id
}

output "subnet_ids" {
  description = "EKS subnet IDs"
  value       = aws_subnet.eks_public[*].id
}

output "node_group_name" {
  description = "EKS node group name"
  value       = aws_eks_node_group.main.node_group_name
}

output "node_group_status" {
  description = "EKS node group status"
  value       = aws_eks_node_group.main.status
} 