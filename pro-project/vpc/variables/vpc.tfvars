aws_region      = "us-east-1"
project_name = "pro-project"
environment = "dev"
name        = "use1-${data.aws_caller_identity.current.account_id}"
eks_cluster_name = null

vpc_cidr = "10.0.0.0/16"

secondary_cidr_blocks = []

az_count = 2

public_subnets = [
  "10.0.0.0/24",
  "10.0.1.0/24"
]

public_subnet_names = ["public-${var.aws_region}a", "public-${var.aws_region}b"]

private_subnets = [
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnet_names = ["private-${var.aws_region}a", "private-${var.aws_region}b"]

enable_nat_gateway     = false
single_nat_gateway     = true
one_nat_gateway_per_az = false