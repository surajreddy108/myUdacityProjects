provider "aws" {
  region                  = "us-east-1"
  access_key = "----------------"
  secret_key = "---------------------"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

 tags = {
    Name = "myVPC"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "mysubnet"
  }
}

resource "aws_instance" "Udacity_T2" {
  ami           = "ami-0be2609ba883822ec"
  count         = "4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  tags = {
    Name = "Udacity T2"
  }
}


resource "aws_instance" "Udacity_M4" {
 ami           = "ami-0be2609ba883822ec"
 count         = "2"
 instance_type = "m4.large"
 subnet_id     = aws_subnet.main.id
tags = {
 Name = "Udacity M4"
 }
}