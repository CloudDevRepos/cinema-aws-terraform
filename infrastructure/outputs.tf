output "cinema_aws_terraform_outputs" {
  value = aws_s3_bucket.cinema_aws_terraform_bucket.id
}

output "aws_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cinema_aws_terraform_s3_distribution.id
}