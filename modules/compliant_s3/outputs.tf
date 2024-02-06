
output "origin_bucket_id" {
  description = "ID of the origin S3 bucket"
  value       = module.origin_complete.s3_origin_id
}
