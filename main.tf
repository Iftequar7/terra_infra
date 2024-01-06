terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

################################## VPC Code ########################################

resource "aws_vpc" "terraform_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "Sample_VPC_Terraform"
  }
}

################################## VPC End #########################################

################################# Subnet Pub_1 #######################################

resource "aws_subnet" "pub_1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.pub_cidr_block

  tags = {
    Name = "Public_Sub_1"
  }
}

################################## subnet Pub_1 End ######################################

################################# Subnet pvt_1 Pub #######################################

resource "aws_subnet" "pvt_1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.pvt_cidr_block

  tags = {
    Name = "Private_Sub_1"
  }
}

################################## subnet pvt_1 End ######################################

############################### Route Table #########################################

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.terraform_vpc.id

  route = []

  tags = {
    Name = "Sample_VPC_RT_Terraform"
  }
}

######################################## Route Table End #################################

resource "aws_route_table_association" "assc" {
  subnet_id      = aws_subnet.pub_1.id
  route_table_id = aws_route_table.rtb.id
}
###################################### IGW ################################################

resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "Terraform_IGW"
  }
}

##################################### IGW assoc ####################################

resource "aws_route" "route" {
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terraform_igw.id
}
