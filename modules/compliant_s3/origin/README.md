# origin

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.35.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_origin_bucket"></a> [origin\_bucket](#module\_origin\_bucket) | git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket | f9e1740cafe597f2764a0d2ee7dbd34a0e19753c |
| <a name="module_origin_log_bucket"></a> [origin\_log\_bucket](#module\_origin\_log\_bucket) | git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket | f9e1740cafe597f2764a0d2ee7dbd34a0e19753c |
| <a name="module_replication_policy"></a> [replication\_policy](#module\_replication\_policy) | git::https://github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-policy | bcdf554783c0e841430f215c94932fb75f86a3e9 |
| <a name="module_replication_role"></a> [replication\_role](#module\_replication\_role) | git::https://github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-assumable-role | bcdf554783c0e841430f215c94932fb75f86a3e9 |
| <a name="module_sns_origin"></a> [sns\_origin](#module\_sns\_origin) | git::https://github.com/terraform-aws-modules/terraform-aws-sns | 30e89b92b6c7e34e4ace30cf2eeeeab2be119cc1 |

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.origin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.origin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.origin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_s3_bucket_notification.sns_origin_notify](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_sns_topic_policy.sns_origin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.origin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [random_integer.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.log_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_origin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abort_incomplete_multipart_upload_days"></a> [abort\_incomplete\_multipart\_upload\_days](#input\_abort\_incomplete\_multipart\_upload\_days) | Days to abort incomplete multipart uploads | `number` | `7` | no |
| <a name="input_access_control_owner"></a> [access\_control\_owner](#input\_access\_control\_owner) | Owner of replicated objects | `string` | `"Destination"` | no |
| <a name="input_aws_s3_service"></a> [aws\_s3\_service](#input\_aws\_s3\_service) | Service of AWS S3 | `string` | `"s3.amazonaws.com"` | no |
| <a name="input_control_object_ownership"></a> [control\_object\_ownership](#input\_control\_object\_ownership) | Control object ownership for the S3 bucket | `bool` | `true` | no |
| <a name="input_deletion_window"></a> [deletion\_window](#input\_deletion\_window) | Description of KMS Origin key | `number` | `10` | no |
| <a name="input_destination_storage_class"></a> [destination\_storage\_class](#input\_destination\_storage\_class) | Initial storage class for replicated objects | `string` | `"STANDARD"` | no |
| <a name="input_email_endpoint"></a> [email\_endpoint](#input\_email\_endpoint) | Email address to receive notifications. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_false_value"></a> [false\_value](#input\_false\_value) | Default value of false | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | If true, deletes all objects in the bucket for bucket destruction<br>  Default is true, suitable for testing purposes,<br>  not recommended for production use cases | `bool` | `true` | no |
| <a name="input_kms_origin_alias"></a> [kms\_origin\_alias](#input\_kms\_origin\_alias) | Alias of KMS Origin key | `string` | `"kms-origin"` | no |
| <a name="input_kms_origin_description"></a> [kms\_origin\_description](#input\_kms\_origin\_description) | Description of KMS Origin key | `string` | `"KMS Origin key for use with S3 Origin"` | no |
| <a name="input_kms_replica_arn_out"></a> [kms\_replica\_arn\_out](#input\_kms\_replica\_arn\_out) | Output variable for KMS replica ARN. | `string` | n/a | yes |
| <a name="input_log_prefix"></a> [log\_prefix](#input\_log\_prefix) | The target prefix for logging | `string` | `"log/"` | no |
| <a name="input_object_ownership"></a> [object\_ownership](#input\_object\_ownership) | The object ownership setting for the S3 bucket | `string` | `"BucketOwnerEnforced"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of the resource owner | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol of SNS topic subscription | `string` | `"email"` | no |
| <a name="input_replica_mod_status"></a> [replica\_mod\_status](#input\_replica\_mod\_status) | Status of replica modifications | `string` | `"Enabled"` | no |
| <a name="input_replication_config_id"></a> [replication\_config\_id](#input\_replication\_config\_id) | ID of replication configuration rule | `string` | `"ReplicateOriginS3Objects"` | no |
| <a name="input_replication_path"></a> [replication\_path](#input\_replication\_path) | Path of replication policy | `string` | `"/"` | no |
| <a name="input_replication_policy_description"></a> [replication\_policy\_description](#input\_replication\_policy\_description) | Name of replication policy | `string` | `"Policy for Replication Role"` | no |
| <a name="input_replication_policy_name"></a> [replication\_policy\_name](#input\_replication\_policy\_name) | Name of replication policy | `string` | `"replication-policy"` | no |
| <a name="input_replication_role_name"></a> [replication\_role\_name](#input\_replication\_role\_name) | Name of replication role | `string` | `"replication-role"` | no |
| <a name="input_rule_id_1"></a> [rule\_id\_1](#input\_rule\_id\_1) | ID for the first lifecycle rule | `string` | `"TransitionToIA_OneZoneIA_Glacier"` | no |
| <a name="input_rule_id_2"></a> [rule\_id\_2](#input\_rule\_id\_2) | ID for the second lifecycle rule | `string` | `"AbortIncompleteMultipartUploads"` | no |
| <a name="input_rule_status_1"></a> [rule\_status\_1](#input\_rule\_status\_1) | Status for the first lifecycle rule | `string` | `"Enabled"` | no |
| <a name="input_rule_status_2"></a> [rule\_status\_2](#input\_rule\_status\_2) | Status for the second lifecycle rule | `string` | `"Enabled"` | no |
| <a name="input_s3_origin_bk_name"></a> [s3\_origin\_bk\_name](#input\_s3\_origin\_bk\_name) | Name of S3 Origin | `string` | `"origin"` | no |
| <a name="input_s3_origin_log_bk_name"></a> [s3\_origin\_log\_bk\_name](#input\_s3\_origin\_log\_bk\_name) | The name of the origin S3 log bucket | `string` | `"origin-log"` | no |
| <a name="input_s3_replica_arn_out"></a> [s3\_replica\_arn\_out](#input\_s3\_replica\_arn\_out) | Output variable for S3 replica ARN. | `string` | n/a | yes |
| <a name="input_sns_origin_name"></a> [sns\_origin\_name](#input\_sns\_origin\_name) | Name of SNS origin | `string` | `"sns-origin"` | no |
| <a name="input_sse_algorithm_aes"></a> [sse\_algorithm\_aes](#input\_sse\_algorithm\_aes) | The algorithm used for bucket encryption | `string` | `"AES256"` | no |
| <a name="input_sse_algorithm_kms"></a> [sse\_algorithm\_kms](#input\_sse\_algorithm\_kms) | The algorithm used for bucket encryption | `string` | `"aws:kms"` | no |
| <a name="input_tool"></a> [tool](#input\_tool) | Tool used to create resource | `string` | `"Terraform"` | no |
| <a name="input_transition_days_1"></a> [transition\_days\_1](#input\_transition\_days\_1) | Days for the first transition in the first lifecycle rule | `number` | `30` | no |
| <a name="input_transition_days_2"></a> [transition\_days\_2](#input\_transition\_days\_2) | Days for the first transition in the first lifecycle rule | `number` | `60` | no |
| <a name="input_transition_days_3"></a> [transition\_days\_3](#input\_transition\_days\_3) | Days for the first transition in the first lifecycle rule | `number` | `90` | no |
| <a name="input_transition_storage_class_1"></a> [transition\_storage\_class\_1](#input\_transition\_storage\_class\_1) | Storage class for the first transition in the first lifecycle rule | `string` | `"STANDARD_IA"` | no |
| <a name="input_transition_storage_class_2"></a> [transition\_storage\_class\_2](#input\_transition\_storage\_class\_2) | Storage class for the first transition in the first lifecycle rule | `string` | `"ONEZONE_IA"` | no |
| <a name="input_transition_storage_class_3"></a> [transition\_storage\_class\_3](#input\_transition\_storage\_class\_3) | Storage class for the first transition in the first lifecycle rule | `string` | `"GLACIER"` | no |
| <a name="input_true_value"></a> [true\_value](#input\_true\_value) | Default value of true | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_replication_arn"></a> [iam\_replication\_arn](#output\_iam\_replication\_arn) | ARN for S3 bucket replication role |
| <a name="output_s3_origin_id"></a> [s3\_origin\_id](#output\_s3\_origin\_id) | ID of the origin S3 bucket |
<!-- END_TF_DOCS -->
