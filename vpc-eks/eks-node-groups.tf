
resource "aws_eks_node_group" "nodes-poc" {
  cluster_name         = aws_eks_cluster.eks.name
  node_group_name      = "nodes-poc"
  node_role_arn        = aws_iam_role.iam-role-node.arn
  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  instance_types       = ["t3.small"]
  disk_size            = 20
  force_update_version = false
  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 1
  }
  labels = {
    type = "web"
  }
  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.node_cni_policy,
    aws_iam_role_policy_attachment.node_ecr_read_only
  ]
}
