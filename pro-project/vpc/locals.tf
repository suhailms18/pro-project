locals {
  interface_endpoints = {
    for k, v in var.vpc_endpoints :
    k => v if try(v.service_type, "Interface") == "Interface"
  }
}