output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "eks_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}