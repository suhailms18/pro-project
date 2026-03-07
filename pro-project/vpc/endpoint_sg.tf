# module "vpce_sg" {
#   source = "../../modules/terraform-aws-security-group-5.3.1"
  
#   for_each = local.interface_endpoints
#   name        = "${each.key}-vpce-sg"
#   description = "${each.key} vpc endpoint security group"
#   vpc_id      = module.vpc.vpc_id

#   #######################
#   #### INGRESS RULES ####
#   #######################
#   ingress_with_cidr_blocks = [
#     {
#       rule        = "https-443-tcp"
#       cidr_blocks = module.vpc.vpc_cidr_block
#     },
#   ]

#   ######################
#   #### EGRESS RULES ####
#   ######################
#   egress_with_cidr_blocks = [
#     {
#       rule        = "https-443-tcp"
#       cidr_blocks = "0.0.0.0/0"
#     },
#   ]

#   tags = {
#     Project   = "pro-project"
#     ManagedBy = "Terraform"
#     Name      = "${each.key}-vpce-sg"
#   }
# }