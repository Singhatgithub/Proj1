resource "aws_dynamodb_table" "tf_statelocking_tb" {
  name         = "tf-statelocking-tb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "tf-statelocking-tb"
    Environment = "terraform"
  }
}
