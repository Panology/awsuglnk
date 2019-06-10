// Set human readable alias for the account
resource "aws_iam_account_alias" "master" {
  account_alias = "delichty-awsplay-master"
  provider      = "aws.master"
}

// Add Google G-Suite as SAML IdP
resource "aws_iam_saml_provider" "master_googlegsuite" {
  name                   = "GoogleGSuite"
  saml_metadata_document = "${file("saml-metadata/gsuite-panologyinc.com.xml")}"
  provider               = "aws.master"
}

// Create roles to be assumed via Google G-Suite
resource "aws_iam_role" "master_administrator" {
  name               = "Administrator"
  assume_role_policy = "${data.aws_iam_policy_document.master_googlegsuite_assume.json}"
  provider           = "aws.master"
}

resource "aws_iam_role_policy_attachment" "master_administrator" {
  role       = "${aws_iam_role.master_administrator.name}"
  policy_arn = "${var.administrator_default_arn}"
  provider   = "aws.master"
}

resource "aws_iam_role" "master_developer" {
  name               = "Developer"
  assume_role_policy = "${data.aws_iam_policy_document.master_googlegsuite_assume.json}"
  provider           = "aws.master"
}

resource "aws_iam_role_policy_attachment" "master_developer" {
  role       = "${aws_iam_role.master_developer.name}"
  policy_arn = "${var.developer_default_arn}"
  provider   = "aws.master"
}

resource "aws_iam_role" "master_billing" {
  name               = "Billing"
  assume_role_policy = "${data.aws_iam_policy_document.master_googlegsuite_assume.json}"
  provider           = "aws.master"
}

resource "aws_iam_role_policy_attachment" "master_billing" {
  role       = "${aws_iam_role.master_billing.name}"
  policy_arn = "${var.billing_default_arn}"
  provider   = "aws.master"
}
