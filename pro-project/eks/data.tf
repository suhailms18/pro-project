data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "${var.project_name}-state-bucket-${data.aws_caller_identity.current.account_id}"
    key    = "pro-project/vpc/terraform.tfstate"
    region = "${var.aws_region}"
  }
}