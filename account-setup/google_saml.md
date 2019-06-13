# Google SAML for AWS Setup

## Requirements
* AWS Accounts
* Google Enterprise

### Create a Custom Schema for AWS Attributes

You need to create custom schema in your organization so that you can define what roles
google users are allowed to assume in AWS and optional Session Duration parameter. See https://support.google.com/a/answer/6327792

VIA GUI https://support.google.com/a/answer/6208725?hl=en
1. Go to Google Admin > Users > Click top right - manage custom attributes https://admin.google.com/u/1/ac/customschema
2. Click - ADD CUSTOM ATTRIBUTE
	* Category - "AWS SSO"
	* Custom Fields - "AWS ARNS: Role,Provider", Text, Visible to admin, Multi-Value
	* Custom Fields - "AWS Session Duration", Text, Visible to admin, Single-Value

### Create Google SAML application
1. Go to Google Admin > Applications > SAML Apps https://admin.google.com/cloudshift.cc/AdminHome?hl=en#AppsList:serviceType=SAML_APPSlications 
2. Click "+" in bottom right to add new SAML App
	* Select: "Amazon Web Services"
	* Download IdP metadata (will need in next step)
	* Next > Next
	* ACS URL = https://signin.aws.amazon.com/saml
	* Entity ID	= https://signin.aws.amazon.com/saml
	* Start URL = 
	* Name ID = Basic Information, Primary Email, Format: UNSPECIFIED
	* Next
	* RoleSessionName = Basic Information, Primary Email
	* Role = "AWS SSO", "AWS ARNS: Role,Provider"
	* ADD NEW MAPPING
	* https://aws.amazon.com/SAML/Attributes/SessionDuration = "AWS SSO", "AWS Session Duration"
	* FINISH > OK

### Configure your IDP and roles in your AWS account
1. Create new IDP in AWS account(s) using metadata.xml file create above. Take note of idp
	 arn (you will need it in next step)
2. Create IDP roles that you would like to allow users assume. Take note of role
	 arns

### Add AWS SSO roles to Google user
1. Go to Google Admin > Users > Select User > Select User Information > AWS SSO
2. For each AWS account, add an IDP_ARN,Role_ARN. Example `arn:aws:iam::123456789012:role/Google-admin,arn:aws:iam::123456789012:saml-provider/Google`
3. Set "AWS Session Duration" to timeout value in seconds: 28800

### Test login
Login to Gmail > Click Google Apps icon (grid) in top right, Select Amazon Web
Services
(Css AWS URL is) https://accounts.google.com/o/saml2/initsso?idpid=C02a32p1g&spid=1068042225140&forceauthn=false


## Appendix

#### Create Scheme extention via api
To add new schema VIA API

1. Go to google's 
		[schema insert page](https://developers.google.com/admin-sdk/directory/v1/reference/schemas/insert#try-it)

2. Set Customerid to: `my_customer`

Note: that "my_customer" is a variable reference for your actual organization
customer ID. You can lookup or use your actual customer ID here
https://play.google.com/work/adminsettings?pli=1

3. Create schema field for SSO roles & Provider user is allowed to assume
Copy/Paste the following schema into the editor tab and click `EXECUTE`
```json
{
  "fields": 
  [
    {
			"displayName": "AWS ARNS: Role,Provider",
      "fieldName": "role",
      "fieldType": "STRING",
      "readAccessType": "ADMINS_AND_SELF",
      "multiValued": true
    },
    {
			"displayName": "AWS Session Duration",
      "fieldName": "aws_SessionTimeout",
      "fieldType": "STRING",
      "readAccessType": "ADMINS_AND_SELF",
      "multiValued": False
    }
  ],
	"displayName": "AWS SSO",
  "schemaName": "SSO"
}
```
Note, "schemaName", "fieldName" and "displayName" can be whatever you want them
to be

If things work correctly, you should get a 200 return code

#### Create user attributes via api
TODO: write better documentation for this step
See step 7 of https://aws.amazon.com/blogs/security/how-to-set-up-federated-single-sign-on-to-aws-using-google-apps/
