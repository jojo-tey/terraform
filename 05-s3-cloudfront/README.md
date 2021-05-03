# S3 bucket

## Bucket for application log

- `05-s3/application-log.tf`
- Bucket to store logs generated during service operation

## Sessions manager log bucket

- `05-s3/application-log.tf`
- A bucket to store logs of commands executed by users when accessing an instance through AWS SSM
- This log is encrypted for security purposes

## Etc 

- Recommended to reuse code as needed

# AWS Cloud front

Usually use S3 a lot for the purpose of storing static content. The files saved in this way can be provided by S3 itself, but CDN (Contents Delivery Network) is used to reduce costs and improve speed. AWS provides a representative service called Cloudfront.

## If you have domain

- `05-s3/contents-dayone.tf`
- Domain registration and ACM can be manually created in the console, and values can be added to global variables based on the created resources

## If you dont have domain

- `05-s3/contents-dayone-without-domain.tf`
- You can use default domain from Cloud front




