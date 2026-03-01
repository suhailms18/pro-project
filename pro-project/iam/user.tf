module "cli_user" {
  source = "../../modules/terraform-aws-iam-6.4.0/modules/iam-user"

  name = "${var.project_name}-cli-assumer"

  create_login_profile = false
  create_access_key    = true

  create_inline_policy = true
  inline_policy_permissions = {
    AssumeRoleAccess = {
      effect = "Allow"
      actions = ["sts:AssumeRole"]
      resources = [
        module.admin_role.arn
      ]
    }
  }
  

  tags = {
    Name        = "${var.project_name}-cli-assumer"
    ManagedBy   = "Terraform"
    Project     = "pro-project"
    Purpose     = "Admin Role"
  }
}