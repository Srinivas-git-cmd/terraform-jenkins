provider "aws" {
    region = "us-east-1"  
}

resource aws_s3_bucket "jenkins_bucket" {
  bucket = "jenkins-bucket-unique-name-123456"
  acl    = "private"

  tags = {
    Name        = "JenkinsBucket"
    Environment = "Dev"
  }
}



