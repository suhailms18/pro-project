# module "vpc_endpoints" {
#   source = "../../modules/terraform-aws-vpc-6.6.0/modules/vpc-endpoints"

#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   create_security_group      = var.create_security_group
#   security_group_description = var.security_group_description
#   security_group_name = var.security_group_name

#   security_group_rules = {
#     https_ingress = {
#       description = "Allow HTTPS from VPC"
#       protocol    = "tcp"
#       from_port   = 443
#       to_port     = 443
#       type        = "ingress"
#       cidr_blocks = [module.vpc.vpc_cidr_block]
#     }
#   }

#   endpoints = {
#     for k, v in var.vpc_endpoints :
#     k => merge(
#       v,
#       try(v.service_type, "Interface") == "Gateway" ? {
#         route_table_ids = concat(
#           module.vpc.private_route_table_ids,
#           module.vpc.public_route_table_ids
#         )
#       } : {}
#     )
#   }

#   tags = {
#     Project   = "pro-project"
#     ManagedBy = "Terraform"
#   }
# }