# EKS Cluster Settings
eks_cluster_name          = "my-eks-cluster"             # Choose a name for your EKS Cluster
eks_cluster_version       = "1.30"                        # EKS Version (Ensure it's supported)
enable_public_access     = true                           # Set to true if you want public access to your cluster

# Cluster Log Types (Optional, can be customized as per your needs)
cluster_enabled_log_types = ["audit", "api", "authenticator", "controllerManager", "scheduler"]

# VPC Settings (replace with your AWS VPC details)
vpc_id                   = "vpc-084586028ced530c1"                # Replace with your AWS VPC ID
private_subnet_ids       = ["subnet-09a5902273df4f9d0", "subnet-04af62804e04d2f60"]  # Replace with your AWS Private Subnet IDs
control_plane_subnet_ids = ["subnet-0c0ed617a56fcd376"]           # Replace with your AWS Control Plane Subnet ID

# Node Group Settings (Provide details for your node group or leave as empty for default)
eks_managed_node_groups = {}

# Add-ons (Optional, can be customized or left empty)
cluster_addons = {}

# Tags for AWS Resources
tags = {
  "Environment" = "production"  # Replace with appropriate tags
}

# Security Group for HTTPS (Replace with your CIDR blocks or specific IP ranges)
https_443_ingress_cidr_blocks = ["0.0.0.0/0"]  # Example, replace as needed
