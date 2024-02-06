
terraform {
  backend "s3" {
    bucket  = "cloudray-dev-origin-79"
    key     = "dev/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
    # dynamodb_table = "your-lock-table-name"
  }
}

