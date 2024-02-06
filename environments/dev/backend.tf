
terraform {
  backend "s3" {
    bucket  = "use-output-after-apply"
    key     = "dev/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
    # dynamodb_table = "your-lock-table-name"
  }
}
