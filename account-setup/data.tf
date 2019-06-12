data "aws_iam_policy_document" "master_googlegsuite_assume" {
  statement {
    sid     = "GoogleGsuite"
    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = ["${aws_iam_saml_provider.master_googlegsuite.arn}"]
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }

  statement {
    sid     = ""
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.master}:root"]
    }
  }

  provider = "aws.master"
}
