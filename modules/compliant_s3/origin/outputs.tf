
output "s3_origin_id" {
  description = "ID of the origin S3 bucket"
  value       = module.origin_bucket.s3_bucket_id
}

output "iam_replication_arn" {
  description = "ARN for S3 bucket replication role"
  value       = module.replication_role.iam_role_arn
}
