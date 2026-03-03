module "vpc" {
  source = "../../modules/terraform-aws-vpc-6.6.0"

  name = var.name
  cidr = var.vpc_cidr

  secondary_cidr_blocks = var.secondary_cidr_blocks
  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)
  public_subnets  = var.public_subnets
  public_subnet_names = var.public_subnet_names
  private_subnets = var.private_subnets
  private_subnet_names = var.private_subnet_names

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = var.eks_cluster_name != null ? {
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  } : {}

  private_subnet_tags = var.eks_cluster_name != null ? {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  } : {}

  tags = {
    Name        = "${var.name}"
    ManagedBy   = "Terraform"
    Project     = "${var.project_name}"
    Purpose     = "Dedicated VPC"
  }
}