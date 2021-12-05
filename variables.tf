variable "create_user" {
  description   = "Whether to create the IAM User"
  type          = bool
  default       = true
}

variable "name" {
  description   = "Name to be used on all resources"
  type          = string
  default       = null
}

variable "policy_description" {
  description   = "Description for IAM policy"
  type          = string
  default       = null
}

variable "policy_jsons" {
  description = "List of JSON strings of custom policies to be attached to the IAM user"
  type        = list(string)
  default     = []
}

# Example
# local.policy = <<EOF
# {
#    "Version": "2012-10-17",
#    "Statement": [{
#       "Effect": "Allow",
#       "Action": [
#          "ec2:DescribeInstances", 
#          "ec2:DescribeImages",
#          "ec2:DescribeTags", 
#          "ec2:DescribeSnapshots"
#       ],
#       "Resource": "*"
#    }
#    ]
# }
# EOF

variable "policy_name_prefix" {
  description   = "Name to be used on policy name as prefix"
  type          = string
  default       = null
}

variable "policy_path" {
  description   = "Path of thr IAM policy"
  type          = string
  default       = "/"
}

variable "username_prefix" {
  description   = "Name to be used on username as prefix"
  type          = string
  default       = null
}