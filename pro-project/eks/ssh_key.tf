resource "tls_private_key" "eks_ssh" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "eks_ssh" {
  key_name   = "${var.project_name}-eks-ssh-key"
  public_key = tls_private_key.eks_ssh.public_key_openssh
}

resource "local_file" "eks_ssh_private_key" {
  filename        = "${path.module}/${var.project_name}-eks-ssh-key"
  content         = tls_private_key.eks_ssh.private_key_openssh
  file_permission = "0400"
}