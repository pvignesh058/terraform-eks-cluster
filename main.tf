module "https_443_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  name        = "intranet-https-rules"
  description = "Jumphost/Github-actions"
  vpc_id      = var.vpc_id
  ingress_cidr_blocks = var.https_443_ingress_cidr_blocks
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.14.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version

  # Gives Terraform identity admin access to cluster which will
  # allow deploying resources into the cluster
  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = var.enable_public_access
  vpc_id                                   = var.vpc_id
  subnet_ids                               = var.private_subnet_ids
  control_plane_subnet_ids                 = var.control_plane_subnet_ids
  eks_managed_node_groups                  = var.eks_managed_node_groups
  cluster_enabled_log_types                = var.cluster_enabled_log_types
  cluster_addons                           = var.cluster_addons
  # create_kms_key = true
  # create_iam_role = true
  enable_kms_key_rotation = false
  # kms_key_aliases = {}
  kms_key_description       = "eks-kms"
  cluster_service_ipv4_cidr = null
  tags                      = var.tags
  cluster_additional_security_group_ids = [module.https_443_security_group.security_group_id]
}
