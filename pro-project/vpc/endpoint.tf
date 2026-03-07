module "vpc_endpoints" {
  source = "../../modules/terraform-aws-vpc-6.6.0/modules/vpc-endpoints"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  security_group_ids = [module.vpce_sg[each.key].security_group_id]

  endpoints = {
    for k, v in var.vpc_endpoints :
    k => merge(
      v,
      try(v.service_type, "Interface") == "Gateway" ? {
        route_table_ids = concat(
          module.vpc.private_route_table_ids,
          module.vpc.public_route_table_ids
        )
      } : {}
    )
  }

  tags = {
    Project   = "pro-project"
    ManagedBy = "Terraform"
  }
}