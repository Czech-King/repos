terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create VPC
resource "aws_vpc" "VPC-A" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
tags = {
    Name = "VPC-A"
  }
}

# Public Subnet
resource "aws_subnet" "pubsub" {
  vpc_id     = aws_vpc.VPC-A.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  count = 2
tags = {
    Name = "pubsub"
  }
}

# Private Subnet
resource "aws_subnet" "pvtsub" {
  vpc_id     = aws_vpc.VPC-A.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  count = 2
  tags = {
    Name = "pvtsub"
  }
}