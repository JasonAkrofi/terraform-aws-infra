terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

# 1. Define a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}

# 2. Create Subnets
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivateSubnet"
  }
}

# 3. Create an EC2 Instance
resource "aws_instance" "web" {
  ami                  = "ami-08b5b3a93ed654d19" # Amazon Linux 2 AMI ID
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.public.id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "WebServer"
  }
}

# 4. Create an IAM Role
resource "aws_iam_role" "ec2_role" {
  name = "EC2S3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "EC2S3AccessRole"
  }
}

# 5. Create an IAM Policy
resource "aws_iam_policy" "s3_access" {
  name        = "EC2S3AccessPolicy"
  description = "Policy for EC2 to access S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Effect   = "Allow"
        Resource = "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*"
      }
    ]
  })
}

# 6. Attach IAM Policy to Role
resource "aws_iam_role_policy_attachment" "ec2_s3_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access.arn
}

# 7. Create an IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

# 8. Add an S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-aws-infra-2706" # Make sure the name is globally unique
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Production"
  }
}
