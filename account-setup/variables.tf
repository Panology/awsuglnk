variable "master" {
  description = "Master AWS Account ID"
}

variable "aws_default_region" {
  default = "us-east-2"
}

variable "administrator_default_arn" {
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "developer_default_arn" {
  default = "arn:aws:iam::aws:policy/PowerUserAccess"
}

variable "billing_default_arn" {
  default = "arn:aws:iam::aws:policy/job-function/Billing"
}
