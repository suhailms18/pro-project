module "terraform_state_bucket" {
  source  = "../modules/terraform-aws-s3-bucket-5.10.0"

  bucket = "${var.project_name}-state-bucket-${data.aws_caller_identity.current.account_id}"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  tags = {
    Name        = "${var.project_name}-state-bucket-${data.aws_caller_identity.current.account_id}"
    ManagedBy   = "Terraform"
    Project     = "pro-project"
    Purpose     = "Terraform Backend S3 Bucket"
  }
}