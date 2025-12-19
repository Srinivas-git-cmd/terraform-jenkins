provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "sri" {
  ami           = "ami-0ecb62995f68bb549" 
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}

