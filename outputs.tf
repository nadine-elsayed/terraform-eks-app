output "nadine_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.nadine_cluster.name
}

output "nadine_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = aws_eks_cluster.nadine_cluster.endpoint
}

output "nadine_cluster_ca" {
  description = "EKS Cluster Certificate Authority Data"
  value       = aws_eks_cluster.nadine_cluster.certificate_authority[0].data
}
output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}
