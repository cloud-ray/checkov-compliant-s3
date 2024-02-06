
output "s3_replica_arn" {
  description = "ARN of the replica S3 bucket"
  value       = module.replica_bucket.s3_bucket_arn
}

output "kms_replica_arn" {
  description = "ARN of the replica KMS key"
  value       = aws_kms_key.replica.arn
}
