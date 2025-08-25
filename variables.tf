variable "aws_region" {
  description = "AWS region for Nadine's EKS deployment"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Nadine's EKS cluster name"
  type        = string
  default     = "nadine-cluster2"
}

variable "node_instance_type" {
  description = "EC2 instance type for Nadine's worker nodes"
  type        = string
  default     = "t3.small"
}

variable "desired_capacity" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}
