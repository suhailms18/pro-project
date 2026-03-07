module "vpce_sg" {
  source = "../../modules/terraform-aws-security-group-5.3.1"
  
  for_each = local.interface_endpoints
  name        = "${each.key}-vpce-sg"
  description = "${each.key} vpc endpoint security group"
  vpc_id      = module.vpc.vpc_id

  #######################
  #### INGRESS RULES ####
  #######################

  ingress_cidr_blocks = ["10.10.0.0/16"]

  ingress_ipv6_cidr_blocks = ["2001:db8::/64"]

  ingress_rules = ["https-443-tcp"]

  computed_ingress_rules           = ["ssh-tcp"]
  number_of_computed_ingress_rules = 1

  ingress_with_cidr_blocks = [
    {
      rule        = "https-443-tcp"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  ######################
  #### EGRESS RULES ####
  ######################

  egress_with_cidr_blocks = [
    {
      rule        = "https-443-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Project   = "pro-project"
    ManagedBy = "Terraform"
    Name      = "${each.key}-vpce-sg"
  }
}