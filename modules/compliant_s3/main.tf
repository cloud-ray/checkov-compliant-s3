
module "origin_complete" {
  source = "./origin"
  providers = {
    aws        = aws
    aws.origin = aws.origin
  }
  project_name   = var.project_name
  env            = var.env
  owner          = var.owner
  email_endpoint = var.email_endpoint
  # replica_complete module output values
  s3_replica_arn_out  = module.replica_complete.s3_replica_arn
  kms_replica_arn_out = module.replica_complete.kms_replica_arn
}

module "replica_complete" {
  source = "./replica"
  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
  project_name = var.project_name
  env          = var.env
  owner        = var.owner
  # origin_complete module output values
  iam_replication_arn_out = module.origin_complete.iam_replication_arn
}
