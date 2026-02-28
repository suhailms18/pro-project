output "state_bucket_name" {
  value = module.terraform_state_bucket.s3_bucket_id
}

output "state_bucket_arn" {
  value = module.terraform_state_bucket.s3_bucket_arn
}