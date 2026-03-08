# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "21.15.1"

#   name               = "${local.name}-al2023"
#   region             = var.aws_region
#   kubernetes_version = "1.34"

#   addons = {
#     coredns = {}
#     eks-pod-identity-agent = {
#       before_compute = true
#     }
#     kube-proxy = {}
#     vpc-cni = {
#       before_compute = true
#     }
#   }

#   vpc_id     = data.terraform_remote_state.vpc.outputs.use1_vpc.vpc_id
#   subnet_ids = data.terraform_remote_state.vpc.outputs.use1_vpc.private_subnets

#   self_managed_node_groups = {
#     wrk_grp_1 = {
#       ami_type      = "AL2023_x86_64_STANDARD"
#       ami_id        = data.aws_ami.eks_al2023_1_34.id
#       instance_type = "t2.micro"

#       min_size = 1
#       max_size = 1
#       desired_size = 1

#       cloudinit_pre_nodeadm = [
#         {
#           content_type = "application/node.eks.aws"
#           content      = <<-EOT
#             ---
#             apiVersion: node.eks.aws/v1alpha1
#             kind: NodeConfig
#             spec:
#               kubelet:
#                 config:
#                   shutdownGracePeriod: 30s
#           EOT
#         }
#       ]
#     }
#   }

#   tags = {
#     Project = "eks-lab"
#   }
# }