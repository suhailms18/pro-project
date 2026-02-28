module "github_oidc_iam_role" {
  source = "../../modules/terraform-aws-iam-6.4.0/modules/iam-role"

  name = "${var.project_name}-oidc-role"
  use_name_prefix = false

  enable_github_oidc = true

  oidc_subjects = [
    "repo:suhailms18/pro-project:pull_request",
    "suhailms18/pro-project:ref:refs/heads/master",
  ]

  policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  tags = {
    Name        = "${var.project_name}-oidc-role"
    ManagedBy   = "Terraform"
    Project     = "pro-project"
    Purpose     = "GitHub OIDC Role"
  }
}