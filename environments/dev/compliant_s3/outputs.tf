
output "origin_bucket_id" {
  description = "ID of the origin S3 bucket"
  value       = module.compliant_s3_backend.origin_bucket_id
}
