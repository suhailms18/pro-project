variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "name" {
  type        = string
  description = "VPC name"
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the EKS Cluster"
}

variable "vpc_cidr" {
  type        = string
  description = "Primary VPC CIDR"
}

variable "secondary_cidr_blocks" {
  type        = list(string)
  description = "Secondary CIDR blocks"
}

variable "az_count" {
  description = "Number of AZs to use"
  type        = number
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "public_subnet_names" {
  description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated"
  type        = list(string)
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDRs"
}

variable "private_subnet_names" {
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated"
  type        = list(string)
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway"
}

variable "single_nat_gateway" {
  type        = bool
  description = "Use single NAT"
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "One NAT per AZ"
}

variable "create_security_group" {
  description = "Determines if a security group is created"
  type        = bool
  default     = false
}

variable "vpc_endpoints" {
  type = map(any)
}