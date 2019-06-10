# AWSUGLnk Workshop Run-Thru Notes | Serverless WebApp

```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::454844014023-wildrydes/*"
  }]
}
```

http://454844014023-wildrydes.s3-website-us-west-2.amazonaws.com/

aws s3 sync work/ s3://454844014023-wildrydes

http://d1tvtzp15pk1dc.cloudfront.net/
arn:aws:dynamodb:us-west-2:454844014023:table/Wildrydes_Emails

{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Action": "dynamodb:PutItem",
       "Resource": "arn:aws:dynamodb:us-west-2:454844014023:table/Wildrydes_Emails"
     }
   ]
 }

us-west-2:c21a50fb-8afe-4f17-a756-801602c13e6d

us-west-2_ElvPvdz5x
6h56rqthgbmen4ssi01ed68dfu

https://5sdla601df.execute-api.us-west-2.amazonaws.com/prod
