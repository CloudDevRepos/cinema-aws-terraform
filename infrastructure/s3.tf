#  S3 RESOURCES

# Bucket resource
resource "aws_s3_bucket" "cinema_aws_terraform_bucket" {
  bucket        = "${local.prefix}-app"
  force_destroy = true

  tags = local.common_tags
}

# Enabling Private ACLs
resource "aws_s3_bucket_ownership_controls" "cinema_aws_terraform_owner" {
  bucket = aws_s3_bucket.cinema_aws_terraform_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl_private" {
  depends_on = [aws_s3_bucket_ownership_controls.cinema_aws_terraform_owner]

  bucket = aws_s3_bucket.cinema_aws_terraform_bucket.id
  acl    = "private"
}

# Public access block
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.cinema_aws_terraform_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

}

# Enabling bucket versioning
resource "aws_s3_bucket_versioning" "cinema_aws_terraform_bucket_versioning" {
  bucket = aws_s3_bucket.cinema_aws_terraform_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Bucket policy using a data block
resource "aws_s3_bucket_policy" "cinema_aws_terraform_bucket_policy" {
  bucket = aws_s3_bucket.cinema_aws_terraform_bucket.id
  policy = data.aws_iam_policy_document.data_bucket_policy.json
}

# Static website
resource "aws_s3_bucket_website_configuration" "cinema_aws_terraform_website_hosting" {
  bucket = aws_s3_bucket.cinema_aws_terraform_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

}

# Bucket policy -> Cloudfront configuration
data "aws_iam_policy_document" "data_bucket_policy" {
  statement {
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.cinema_aws_terraform_bucket.arn,
      "${aws_s3_bucket.cinema_aws_terraform_bucket.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cinema_aws_terraform_origin_access.iam_arn]
    }
  }
}
