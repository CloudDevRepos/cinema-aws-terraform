## Cinema-AWS-Terraform
This project was built using React for application development, Redux for state management, Git for version control, CircleCI as a pipeline for CI/CD, AWS-s3 for storing our static application, AWS Cloudfront for content delivery, Slack for progress reporting on deployment,Sentry for monitoring and Terraform .
### CircleCI
- For Continuous Integration and Continuous Delivery using Github.
- Create Public and Private keys for the project.
- Paste the public key in the Project Repo -> `Settings` -> `add deploy key`.
- Paste the Private key in the CircleCI settings for the project.
- Config different environmental variables for AWS s3 and CloudFront.

### AWS s3
- Create an IAM user then add permissions using environmental variables on CircleCI.
- Environmental variables -> `Access key + Secret access key`.
- Create buckets for development, staging and production, add bucket policy and static hosting.
- Add all the environmental variables to CircleCI.

### AWS Cloudfront
- Create distributions for all stages for the edge locations -> `AWS`.
- Create environmental variables for development, staging and production -> `CircleCI`.
- Invalidations can be added using code.

### Slack
- Create a new workspace on Slack for the project and add a channel.
- Navigate to settings of the `workspace` -> `setting & administration` -> `manage app`.
- Search from the `app directory` circleci and add it -> `add channel` -> `then copy the hook URL`.
- Navigate to circleci -> `project's settings` -> `webhooks` and `add a webhook URL from slack`.
- Add a `secret key` -> `select job completed` and `then test with a ping`.
##### Slack Integration
- Navigate to the `project settings` -> `Slack integration` and `create a slack application`.
- Go to permissions -> `scope` and add `chat:write | files:write` and then install to workspace under `OAuth token section`.
- Add the token to circleci's environment variables -> `SLACK_ACCESS_TOKEN`.

### Terraform

### Docker

### Sentry

