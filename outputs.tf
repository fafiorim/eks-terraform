output "cluster_endpoint" {
  value = aws_eks_cluster.k8s_cluster.endpoint
}

output "kubeconfig" {
  value = <<EOT
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.k8s_cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.k8s_cluster.certificate_authority[0].data}
  name: ${aws_eks_cluster.k8s_cluster.name}
contexts:
- context:
    cluster: ${aws_eks_cluster.k8s_cluster.name}
    user: ${aws_eks_cluster.k8s_cluster.name}
  name: ${aws_eks_cluster.k8s_cluster.name}
current-context: ${aws_eks_cluster.k8s_cluster.name}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.k8s_cluster.name}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - eks
        - get-token
        - --region
        - ${var.aws_region}
        - --cluster-name
        - ${aws_eks_cluster.k8s_cluster.name}
EOT
}
