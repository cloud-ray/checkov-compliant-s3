
# Origin Bucket Region
provider "aws" {
  alias  = "origin"
  region = var.origin_region
}

# Replica Region
provider "aws" {
  alias  = "replica"
  region = var.replica_region
}
