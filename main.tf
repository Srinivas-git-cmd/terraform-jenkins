provider "aws" {
    region = "us-east-1"  
}

provider "aws_s3_bucket" "jenkins_bucket" {
  bucket = "jenkins-bucket-98765" # Change to a unique bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "JenkinsBucket"
    Environment = "Dev"
  }
}


