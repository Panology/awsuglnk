# AWS User Group Lincoln (AWSUGLnk)
This is the repo for the AWS Users Group Lincoln (Lincoln, NE).

Content:

* `Workshops` - These submodules contain the various workshops we conduct
* `account-setup` - This contains the best practices and code we put together to help automate AWS account setup
* `git-secrets` - Prevents you from committing passwords and other sensitive information to a git repository.
* `prowler` - AWS CIS Benchmark Tool

Some things we would use:

* A free SAML IDP we could use to play with
* [SAML2AWS](https://github.com/Versent/saml2aws) for CLI access with an SSO account

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
