# AWS Acount Setup

Here is the start to our notes and code for setting up a new AWS account. This is intentionally a very rough start, so that the AWSUGLnk members can contribute.

The [Terraform](https://terraform.io) code was largely based upon an article by Emmi Khaos titled [Automated AWS account initialization with Terraform and OneLogin SAML SSO](https://medium.com/@EmiiKhaos/automated-aws-account-initialization-with-terraform-and-onelogin-saml-sso-1301ff4851ab). However, instead of using [OneLogin](https://www.onelogin.com) we are using Google's G-Suite. There are many other federated identity providers one could use, including ADFS.

Some things we could use:

* A free SAML IDP we could use to play with
* [SAML2AWS](https://github.com/Versent/saml2aws) for CLI access with an SSO account
* [aws_account_utils](https://github.com/Panology/aws_account_utils) - A collection of helpers for creating and modifying AWS account details (written in Ruby))

Instructions for setting up [Google's G-Suite](google_saml.md) as an Identity Provider (thanks Brian!).

When creating a new account, these things need to be done:

* IAM user for initial account setup
  * Do this in a CloudFormation template so it can be torn down easily
  * This user will need an API Key
* Setup account alias [iam_account_alias](https://www.terraform.io/docs/providers/aws/r/iam_account_alias.html)
* Set a password policy [iam_account_password_policy](https://www.terraform.io/docs/providers/aws/r/iam_account_password_policy.html)
* Setup [CloudTrail](https://www.terraform.io/docs/providers/aws/r/cloudtrail.html)
* Setup Billing Alerts ([see this example](https://github.com/billtrust/terraform-aws-billing-alarm))

Steps that will always be manual:

* Setup MFA on root account
* Disable unused regions in STS (IAM -> Account Settings)
* Fill out the contacts in My Account
* Setup Security Challenge Questions in My Account
* [Grant access to billing information](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html)

Roles you should create:

* Security (what policy should we use?)
* Administrator
* Billing
* Developer
