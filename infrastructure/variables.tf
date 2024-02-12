variable "prefix" {
  default = "cinema-aws-terraform"
}

variable "project" {
  default = "cinema-aws-terraform-app"
}

# Cloudfront set-up
variable "custom_error_response" {
  type = list(object({
    error_caching_min_ttl = number
    error_code            = number
    response_code         = number
    response_page_path    = string
  }))
  description = "List of one or more custom error response element maps"
  default = [
    {
      error_caching_min_ttl = 10
      error_code            = 400
      response_code         = 200
      response_page_path    = "/index.html"
    },
    {
      error_caching_min_ttl = 10
      error_code            = 403
      response_code         = 200
      response_page_path    = "/index.html"
    },
    {
      error_caching_min_ttl = 10
      error_code            = 404
      response_code         = 200
      response_page_path    = "/index.html"
    },
    {
      error_caching_min_ttl = 10
      error_code            = 405
      response_code         = 200
      response_page_path    = "/index.html"
    },
  ]
}


