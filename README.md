## Cinema-AWS-Terraform
This project was built using React for application development, Redux for state management, Git for version control, CircleCI as a pipeline for CI/CD, AWS-s3 for storing our static application, AWS Cloudfront for content delivery, Slack for progress reporting on deployment,Sentry for monitoring and Terraform .
### CircleCI
- For Continuous Integration and Continuous Delivery using Github.
- Create Public and Private keys for the project.
- Paste the public key in the Project Repo -> `Settings` -> `add deploy key`.
- Paste the Private key in the CircleCI settings for the project.

### AWS s3
- Create an IAM user then add permissions using environmental variables on CircleCI.
- Environmental variables -> `Access key + Secret access key`.
- Create buckets for development, staging and production, add bucket policy and static hosting.
- Add all the environmental variables to CircleCI.

### AWS Cloudfront
- Create distributions for all stages for the edge locations -> `AWS`.
- Create environmental variables for development, staging and production -> `CircleCI`.
- Invalidations can be added using code.

### Docker

### Terraform

### Sentry

### Slack