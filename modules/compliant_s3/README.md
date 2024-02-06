# compliant_s3

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_origin_complete"></a> [origin\_complete](#module\_origin\_complete) | ./origin | n/a |
| <a name="module_replica_complete"></a> [replica\_complete](#module\_replica\_complete) | ./replica | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email_endpoint"></a> [email\_endpoint](#input\_email\_endpoint) | Email address to receive notifications. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_origin_region"></a> [origin\_region](#input\_origin\_region) | Region where the statefile bucket is located. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of the resource owner | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_replica_region"></a> [replica\_region](#input\_replica\_region) | Region where the replica S3 bucket is located. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_origin_bucket_id"></a> [origin\_bucket\_id](#output\_origin\_bucket\_id) | ID of the origin S3 bucket |
<!-- END_TF_DOCS -->
