
module "origin_log_bucket" {
  # CKV_TF_1 - Ensure Terraform module sources use a commit hash - Version = 4.1.0
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket?ref=f9e1740cafe597f2764a0d2ee7dbd34a0e19753c"

  bucket = local.s3_origin_log_name

  # CKV_AWS_19 - Ensure all data stored in the S3 bucket is securely encrypted at rest
  # CKV_AWS_145 - Ensure that S3 buckets are encrypted with KMS by default
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = var.sse_algorithm_aes
      }
    }
  }

  # CKV_AWS_21 - Ensure all data stored in the S3 bucket have versioning enabled
  versioning = {
    status = var.true_value
    # mfa_delete = false CKV_AWS_93 - Ensure S3 bucket policy does not lockout all but root user. (Prevent lockouts needing root account fixes)
  }

  # CKV2_AWS_65 - Ensure S3 bucket access control lists (ACLs) in are use
  control_object_ownership = var.control_object_ownership
  object_ownership         = var.object_ownership


  # CKV_AWS_53 - Ensure S3 bucket has block public ACLS enabled
  # CKV_AWS_54 - Ensure S3 bucket has block public policy enabled"
  # CKV_AWS_55 - Ensure S3 bucket has ignore public ACLs enabled
  # CKV_AWS_56 - Ensure S3 bucket has 'restrict_public_bucket' enabled
  # (also CKV2_AWS_6	- Ensure that S3 bucket has a Public Access block)
  block_public_acls       = var.true_value # CKV_AWS_53
  block_public_policy     = var.true_value # CKV_AWS_54
  ignore_public_acls      = var.true_value # CKV_AWS_55
  restrict_public_buckets = var.true_value # CKV_AWS_56


  # CKV2_AWS_61 - Ensure that an S3 bucket has a lifecycle configuration
  lifecycle_rule = [
    {
      id     = var.rule_id_1
      status = var.rule_status_1

      transition = [
        {
          days          = var.transition_days_1
          storage_class = var.transition_storage_class_1
        },
        {
          days          = var.transition_days_2
          storage_class = var.transition_storage_class_2
        },
        {
          days          = var.transition_days_3
          storage_class = var.transition_storage_class_3
        }
      ]
    },
    {
      id     = var.rule_id_2
      status = var.rule_status_2

      # CKV_AWS_300	- Ensure S3 lifecycle configuration sets period for aborting failed uploads
      abort_incomplete_multipart_upload_days = var.abort_incomplete_multipart_upload_days
    }
  ]

  attach_policy = var.true_value
  policy        = data.aws_iam_policy_document.log_bucket_policy.json
  force_destroy = var.force_destroy

  tags = {
    Environment = var.env
    Project     = var.project_name
    Owner       = var.owner
    IACTool     = var.tool
  }
}

# Origin Log Bucket Policy
data "aws_iam_policy_document" "log_bucket_policy" {
  statement {
    sid       = "S3ServerAccessLogsPolicy"
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${module.origin_log_bucket.s3_bucket_arn}/${var.log_prefix}*"] ### DIRECT VALUE

    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [module.origin_bucket.s3_bucket_arn] ### DIRECT VALUE
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}
