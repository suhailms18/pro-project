module "cli_user" {
  source = "../../modules/terraform-aws-iam-6.4.0/modules/iam-user"

  name = "${var.project_name}-cli-assumer"

  create_login_profile = false
  create_access_key    = true

  create_inline_policy = false

  policies = {
    assume_role = data.aws_iam_policy_document.cli_assumer_trust_policy.json
  }
  

  tags = {
    Name        = "${var.project_name}-cli-assumer"
    ManagedBy   = "Terraform"
    Project     = "pro-project"
    Purpose     = "Admin Role"
  }
}

data "aws_iam_policy_document" "cli_assumer_trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    resources = [
      module.admin_role.arn
    ]
  }
}