output "master_saml_provider_arn" {
  value = "${aws_iam_saml_provider.master_googlegsuite.arn}"
}

output "administrator_role_arn" {
  value = "${aws_iam_role.master_administrator.arn}"
}

output "developer_role_arn" {
  value = "${aws_iam_role.master_developer.arn}"
}

output "billing_role_arn" {
  value = "${aws_iam_role.master_billing.arn}"
}
