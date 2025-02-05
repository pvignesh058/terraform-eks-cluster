output "eks_cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = try(module.eks.cluster_id, "")
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS Cluster"
  value       = try(module.eks.cluster_arn, "")
}

output "out-https_443_security_group" {
  description = "https_443_security_group Security Group ID"
  value = try(module.https_443_security_group.security_group_id, "")
}
