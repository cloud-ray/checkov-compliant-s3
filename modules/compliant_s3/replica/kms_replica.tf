# CKV_AWS_145 - Ensure that S3 buckets are encrypted with KMS by default

# KMS Replica Key
resource "aws_kms_key" "replica" {
  provider                = aws.replica
  description             = var.kms_replica_description
  deletion_window_in_days = var.deletion_window
  enable_key_rotation     = var.true_value # CKV_AWS_7 - Ensure rotation for customer created CMKs is enabled

  tags = {
    Environment = var.env
    Project     = var.project_name
    Owner       = var.owner
    IACTool     = var.tool
  }
}

# Replica Key Alias
resource "aws_kms_alias" "replica" {
  provider      = aws.replica
  name          = "alias/${var.kms_replica_alias}"
  target_key_id = aws_kms_key.replica.key_id
}

# CKV2_AWS_64 - Ensure KMS key Policy is defined
resource "aws_kms_key_policy" "replica" {
  provider = aws.replica

  key_id = aws_kms_key.replica.key_id

  policy = jsonencode({
    Id      = "KMS-Replica-Policy"
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:GenerateDataKey*",
          "kms:Decrypt"
        ]
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Resource = "*"
        Sid      = "Allow S3 access for encryption"
        Condition = {
          StringEquals = {
            "s3:ResourceArn" = module.replica_bucket.s3_bucket_arn ### DIRECT VALUE
          }
        }
      },
      {
        Action = "kms:*",
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Resource = "*"
        Sid      = "Allow full access to the root user"
      }
    ]
  })
}
