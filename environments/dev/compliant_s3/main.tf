

module "compliant_s3_backend" {
  source = "../../../modules/compliant_s3"
  providers = {
    aws = aws
  }
  origin_region  = var.origin_region
  replica_region = var.replica_region
  project_name   = var.project_name
  env            = var.env
  owner          = var.owner
  email_endpoint = var.email_endpoint
}

