# Official Backend for Compliant S3 .tfstate 

terraform {
  backend "s3" {
    bucket  = "cloudray-compliant-s3-backend"
    key     = "dev/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
    # dynamodb_table = "your-lock-table-name"
  }
}
