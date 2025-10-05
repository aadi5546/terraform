resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "my_app_bucket" {
  bucket = "${var.my_env}-batch3-app-bucket-${random_id.suffix.hex}"

  tags = {
    Name = "${var.my_env}-batch3-app-bucket"
  }
}

