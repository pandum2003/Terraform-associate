# Resource Block: Create Random Pet Name 
resource "random_pet" "petname" {
  length    = 6
  separator = "-1"
}

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket = random_pet.petname.id
  region = "us-east-1"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = random_pet.petname.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

