# root/environments/dev/backend.tf

terraform {
  backend "s3" {
    bucket  = "cloudray-dev-origin-85"
    key     = "dev/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
    # dynamodb_table = "your-lock-table-name"
  }
}
