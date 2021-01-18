resource "aws_iam_role" "ec2"{
    name = "ec2_s3_role"
    assume_role_policy = <<-EOF
    {
         "Version": "2012-10-17",
         "Statement": [
          {
              "Sid": "",
              "Effect": "Allow",
              "Action": "sts:AssumeRole",
              "Principal": {
              "Service": "ec2.amazonaws.com"
              }
          }
         ]
    }
    EOF
    tags={
        Name = "ec2-role"
    }
}

resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2-s3_policy"
  role = aws_iam_role.ec2.id

  policy = <<-EOF
  {
      "Version": "2012-10-17",
      "Statement": [
      {
            "Effect": "Allow",
            "Action": [
               "s3:PutObject",
               "s3:GetObject",
               "s3:ListAllMyBuckets",
               "s3:ListBucketVersions",
               "s3:CreateBucket",
               "s3:GetObjectTagging",
               "s3:ListBucket",
               "s3:GetObjectVersion"],                       
            "Resource": "*"            
        }
       ]
    }
    EOF
}

resource "aws_iam_instance_profile" "ec2_profile"{
    name = "ec2-profile"
    role = aws_iam_role.ec2.id
}

