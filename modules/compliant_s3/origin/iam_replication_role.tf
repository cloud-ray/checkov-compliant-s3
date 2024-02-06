# Create Replication Role
module "replication_role" {
  # CKV_TF_1 - Ensure Terraform module sources use a commit hash - Version = 5.33.1
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-assumable-role?ref=bcdf554783c0e841430f215c94932fb75f86a3e9"

  create_role                       = var.true_value
  role_name                         = "${var.project_name}-${var.env}-${var.replication_role_name}"
  role_requires_mfa                 = var.false_value
  trusted_role_services             = [var.aws_s3_service]
  custom_role_policy_arns           = [module.replication_policy.arn]
  number_of_custom_role_policy_arns = 1

  tags = {
    Environment = var.env
    Project     = var.project_name
    Owner       = var.owner
    IACTool     = var.tool
  }
}

# Create Replication Role Policy
module "replication_policy" {
  # CKV_TF_1 - Ensure Terraform module sources use a commit hash - Version = 5.33.1
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-policy?ref=bcdf554783c0e841430f215c94932fb75f86a3e9"

  name        = "${var.project_name}-${var.env}-${var.replication_policy_name}"
  path        = var.replication_path
  description = var.replication_policy_description

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.origin_bucket.s3_bucket_arn}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.origin_bucket.s3_bucket_arn}/*"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags",
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:PutObjectTagging"
      ],
      "Effect": "Allow",
      "Resource": "${var.s3_replica_arn_out}/*"
    },
    {
      "Action": [
        "kms:Decrypt"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_kms_key.origin.arn}"
      ]
    },
    {
      "Action": [
        "kms:Encrypt"
      ],
      "Effect": "Allow",
      "Resource": [
        "${var.kms_replica_arn_out}"
      ]
    }
  ]
}
EOF

  tags = {
    Environment = var.env
    Project     = var.project_name
    Owner       = var.owner
    IACTool     = var.tool
  }
}
