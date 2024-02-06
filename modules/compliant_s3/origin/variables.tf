### Outputs as Inputs ###

variable "s3_replica_arn_out" {
  description = "Output variable for S3 replica ARN."
  type        = string
}

variable "kms_replica_arn_out" {
  description = "Output variable for KMS replica ARN."
  type        = string
}



### Locals Variables - All ###

variable "s3_origin_bk_name" {
  description = "Name of S3 Origin"
  type        = string
  default     = "origin"
}

variable "s3_origin_log_bk_name" {
  description = "The name of the origin S3 log bucket"
  type        = string
  default     = "origin-log"
}



### Common Variables - All ###

variable "project_name" {
  description = "The name of the project"
  type        = string
}
variable "env" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "owner" {
  description = "Name of the resource owner"
  type        = string
}

variable "tool" {
  description = "Tool used to create resource"
  type        = string
  default     = "Terraform"
}

variable "true_value" {
  description = "Default value of true"
  type        = bool
  default     = true
}

variable "false_value" {
  description = "Default value of false"
  type        = bool
  default     = false
}



### Common Variables - S3 All ###

variable "control_object_ownership" {
  description = "Control object ownership for the S3 bucket"
  type        = bool
  default     = true
}

variable "object_ownership" {
  description = "The object ownership setting for the S3 bucket"
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "rule_id_1" {
  description = "ID for the first lifecycle rule"
  type        = string
  default     = "TransitionToIA_OneZoneIA_Glacier"
}

variable "rule_status_1" {
  description = "Status for the first lifecycle rule"
  type        = string
  default     = "Enabled"
}

variable "transition_days_1" {
  description = "Days for the first transition in the first lifecycle rule"
  type        = number
  default     = 30
}

variable "transition_storage_class_1" {
  description = "Storage class for the first transition in the first lifecycle rule"
  type        = string
  default     = "STANDARD_IA"
}

variable "transition_days_2" {
  description = "Days for the first transition in the first lifecycle rule"
  type        = number
  default     = 60
}

variable "transition_storage_class_2" {
  description = "Storage class for the first transition in the first lifecycle rule"
  type        = string
  default     = "ONEZONE_IA"
}

variable "transition_days_3" {
  description = "Days for the first transition in the first lifecycle rule"
  type        = number
  default     = 90
}

variable "transition_storage_class_3" {
  description = "Storage class for the first transition in the first lifecycle rule"
  type        = string
  default     = "GLACIER"
}

variable "rule_id_2" {
  description = "ID for the second lifecycle rule"
  type        = string
  default     = "AbortIncompleteMultipartUploads"
}

variable "rule_status_2" {
  description = "Status for the second lifecycle rule"
  type        = string
  default     = "Enabled"
}

variable "abort_incomplete_multipart_upload_days" {
  description = "Days to abort incomplete multipart uploads"
  type        = number
  default     = 7
}

variable "force_destroy" {
  description = <<EOF
  If true, deletes all objects in the bucket for bucket destruction
  Default is true, suitable for testing purposes,
  not recommended for production use cases
  EOF
  type        = bool
  default     = true
}



### Common Variables - S3 Origin & S3 Replica  ###

variable "log_prefix" {
  description = "The target prefix for logging"
  type        = string
  default     = "log/"
}

variable "sse_algorithm_kms" {
  description = "The algorithm used for bucket encryption"
  type        = string
  default     = "aws:kms"
}



### Common Variables - S3 Origin Log & S3 Replica Log ###

variable "sse_algorithm_aes" {
  description = "The algorithm used for bucket encryption"
  type        = string
  default     = "AES256"
}



### Common Variables - KMS  ###

variable "deletion_window" {
  description = "Description of KMS Origin key"
  type        = number
  default     = 10
}



### Common Variables - SNS  ###

variable "sns_origin_name" {
  description = "Name of SNS origin"
  type        = string
  default     = "sns-origin"
}

variable "protocol" {
  description = "Protocol of SNS topic subscription"
  type        = string
  default     = "email"
}

variable "email_endpoint" {
  description = "Email address to receive notifications."
  type        = string
}



### IAM - Replication Role Variables ###

variable "replication_role_name" {
  description = "Name of replication role"
  type        = string
  default     = "replication-role"
}

variable "aws_s3_service" {
  description = "Service of AWS S3"
  type        = string
  default     = "s3.amazonaws.com"
}

variable "replication_policy_name" {
  description = "Name of replication policy"
  type        = string
  default     = "replication-policy"
}

variable "replication_path" {
  description = "Path of replication policy"
  type        = string
  default     = "/"
}

variable "replication_policy_description" {
  description = "Name of replication policy"
  type        = string
  default     = "Policy for Replication Role"
}



### Custom Variables - S3 Origin ###

variable "replication_config_id" {
  description = "ID of replication configuration rule"
  type        = string
  default     = "ReplicateOriginS3Objects"
}

variable "replica_mod_status" {
  description = "Status of replica modifications"
  type        = string
  default     = "Enabled"
}

variable "destination_storage_class" {
  description = "Initial storage class for replicated objects"
  type        = string
  default     = "STANDARD"
}

variable "access_control_owner" {
  description = "Owner of replicated objects"
  type        = string
  default     = "Destination"
}



### Custom Variables - KMS Origin ###

variable "kms_origin_description" {
  description = "Description of KMS Origin key"
  type        = string
  default     = "KMS Origin key for use with S3 Origin"
}

variable "kms_origin_alias" {
  description = "Alias of KMS Origin key"
  type        = string
  default     = "kms-origin"
}
