# Backend Variables
variable "state_bucket_name" {
  default = "proj-demo-state-bucket"
}

variable "state_table_name" {
  default = "proj-demo-state-table"
}

variable "aws_region" {
  default = "us-east-1"
}


# backend resources
resource "aws_dynamodb_table" "my_state_table" {
  name         = var.state_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = var.state_table_name
  }
}

resource "aws_s3_bucket" "my_state_bucket" {
  bucket = var.state_bucket_name
  tags = {
    Name = var.state_bucket_name
  }
}

# dev 

module "dev-app" {
  source        = "./my_app_infra_module"
  my_env        = "dev"
  instance_type = "t2.micro"
  ami           = "ami-007855ac798b5175e"
}

#prd
module "prd-app" {
  source        = "./my_app_infra_module"
  my_env        = "prd"
  instance_type = "t2.medium"
  ami           = "ami-007855ac798b5175e"
}

#stg
module "stg-app" {
  source        = "./my_app_infra_module"
  my_env        = "stg"
  instance_type = "t2.small"
  ami           = "ami-007855ac798b5175e"

}
