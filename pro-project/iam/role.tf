module "admin_role" {
  source = "../../modules/terraform-aws-iam-6.4.0/modules/iam-role"

  name = "${var.project_name}-admin-role"
  use_name_prefix = false

  trust_policy_permissions = data.aws_iam_policy_document.admin_role_trust_policy.json

  policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  tags = {
    Name        = "${var.project_name}-admin-role"
    ManagedBy   = "Terraform"
    Project     = "pro-project"
    Purpose     = "Admin Role"
  }

  depends_on = [module.cli_user]
}

data "aws_iam_policy_document" "admin_role_trust_policy" {
  statement {
    sid     = "AllowUserAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [module.cli_user.arn]
    }
  }
}