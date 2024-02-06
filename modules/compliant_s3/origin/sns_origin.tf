# CKV2_AWS_62 - Ensure S3 buckets should have event notifications enabled

# S3 Origin SNS Topic
module "sns_origin" {
  # CKV_TF_1 - Ensure Terraform module sources use a commit hash - Version = 6.0.0
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-sns?ref=30e89b92b6c7e34e4ace30cf2eeeeab2be119cc1"

  name = "${var.project_name}-${var.env}-${var.sns_origin_name}"

  create_topic_policy = var.false_value

  tags = {
    Environment = var.env
    Project     = var.project_name
    Owner       = var.owner
    IACTool     = var.tool
  }
}

# Create Custom SNS Policy
data "aws_iam_policy_document" "sns_origin_policy" {
  statement {
    actions = ["sns:Publish"]
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    resources = [module.sns_origin.topic_arn]
  }
}

# Attach Custom SNS Policy
resource "aws_sns_topic_policy" "sns_origin" {
  arn    = module.sns_origin.topic_arn
  policy = data.aws_iam_policy_document.sns_origin_policy.json
}

# Create S3 Origin Notifications
resource "aws_s3_bucket_notification" "sns_origin_notify" {
  bucket = module.origin_bucket.s3_bucket_id ### DIRECT VALUE

  topic {
    topic_arn = module.sns_origin.topic_arn
    events    = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]

    # Optional
    # filter_prefix = "${var.env}/"
    # filter_suffix = ".tfstate"
  }

  depends_on = [module.sns_origin.topic_arn]
}

# Get SNS Email Alerts
resource "aws_sns_topic_subscription" "origin" {
  # provider  = aws
  topic_arn = module.sns_origin.topic_arn
  protocol  = var.protocol
  endpoint  = var.email_endpoint
}
