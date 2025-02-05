########## EKS Cluster Variables ##########
variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Version of the EKS Cluster"
  type        = string
  default     = "1.30"
}

variable "enable_public_access" {
  description = "Whether to keep EKS Cluster access public, default is false"
  type        = bool
  default     = true
}

variable "cluster_enabled_log_types" {
  description = "Cluster Log Types to Enable"
  type        = list(string)
  default     = ["audit", "api", "authenticator", "controllerManager", "scheduler"]
}

########## Addons ################
variable "cluster_addons" {
  description = "Add On"
  type        = any
  default     = {}
}

########## VPC Variables ##########
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
  type        = list(string)
}

variable "control_plane_subnet_ids" {
  description = "Control Plane Subnet IDs"
  type        = list(string)
}

########## Node Group Variables ##########
variable "eks_managed_node_groups" {
  description = "EKS Managed Node Group Details"
  type        = any
  default     = {}
}

########## Tags ##########
variable "tags" {
  description = "List of tags to be associated with EKS cluster resources"
  type        = map(string)
  default     = {}
}

variable "https_443_ingress_cidr_blocks" {
  description = "Additional Subnets"
  type        = list(string)
}
