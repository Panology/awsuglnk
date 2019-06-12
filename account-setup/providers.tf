// Configure AWS provider
provider "aws" {
  alias                   = "master"
  profile                 = "master"
  region                  = "${var.aws_default_region}"
  shared_credentials_file = "./credentials"
  allowed_account_ids     = ["${var.master}"]
}
