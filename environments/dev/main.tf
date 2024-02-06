
resource "aws_vpc" "this" {
  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}


