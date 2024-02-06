# root/environments/dev/variables.tf

variable "origin_region" {
  description = "Region where the statefile bucket is located."
  type        = string
}

variable "replica_region" {
  description = "Region where the replica S3 bucket is located."
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}
variable "env" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "owner" {
  description = "Name of the resource owner"
  type        = string
}

variable "email_endpoint" {
  description = "Email address to receive notifications."
  type        = string
}
