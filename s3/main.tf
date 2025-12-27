resource "aws_s3_bucket" "my-tf-backend-bucket" {
  bucket = "my-tf-backend-1313"
  region = "ap-south-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
