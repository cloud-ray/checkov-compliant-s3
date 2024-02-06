resource "random_integer" "this" {
  min = 10
  max = 100
}

locals {
  s3_origin_name     = "${var.project_name}-${var.env}-${var.s3_origin_bk_name}-${random_integer.this.id}"
  s3_origin_log_name = "${var.project_name}-${var.env}-${var.s3_origin_log_bk_name}-${random_integer.this.id}"
}
