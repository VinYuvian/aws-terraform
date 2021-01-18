resource "aws_s3_bucket" "s3"{
    bucket = "project-vin1711"
    acl = "private"

    //versioning enabled
    versioning {
        enabled = true
    }

    //lifecycle rule applied on bucket level
    lifecycle_rule{
        id = "vpc171100"
        enabled = true
        transition{
            days = 30
            storage_class = "INTELLIGENT_TIERING"
        }
        transition{
            days = 60
            storage_class = "GLACIER"
        }
        expiration{
            days = 90
        }
    }
    tags={
        Name = "s3_storage"
    }
}


resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}