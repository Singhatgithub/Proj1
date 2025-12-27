terraform {
  backend "s3" {
    bucket = "my-tf-backend-1313"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tf-statelocking-tb"

  }
}

