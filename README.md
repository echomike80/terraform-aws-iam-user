# AWS network load balancer Terraform module

Terraform module which creates an IAM user with several policies on AWS.

## Terraform versions

Terraform 0.12 and newer. 

## Usage

### Target group(s) with only one target id

```hcl
data "aws_iam_policy_document" "for_iam_user_s3_upload" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::<<S3 Bucket>>"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:*"
    ]

    resources = [
      "arn:aws:s3:::<<S3 Bucket>>/*"
    ]
  }
}

module "iam_user_for_s3" {
  source    = "/path/to/module/terraform-aws-iam-user"

  name                  = var.name
  policy_description    = "Allows access to S3 Buckets"
  policy_jsons          = [tostring(data.aws_iam_policy_document.for_iam_user_s3_upload.json)]
  policy_name_prefix    = "pol"
  username_prefix       = "fnu"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_user"></a> [create\_user](#input\_create\_user) | Whether to create the IAM User | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all resources | `string` | `null` | no |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | Description for IAM policy | `string` | `null` | no |
| <a name="input_policy_jsons"></a> [policy\_jsons](#input\_policy\_jsons) | List of JSON strings of custom policies to be attached to the IAM user | `list(string)` | `[]` | no |
| <a name="input_policy_name_prefix"></a> [policy\_name\_prefix](#input\_policy\_name\_prefix) | Name to be used on policy name as prefix | `string` | `null` | no |   
| <a name="input_policy_path"></a> [policy\_path](#input\_policy\_path) | Path of thr IAM policy | `string` | `"/"` | no |
| <a name="input_username_prefix"></a> [username\_prefix](#input\_username\_prefix) | Name to be used on username as prefix | `string` | `null` | no |

## Outputs

No outputs.

## Authors

Module managed by [Marcel Emmert](https://github.com/echomike80).

## License

Apache 2 Licensed. See LICENSE for full details.
