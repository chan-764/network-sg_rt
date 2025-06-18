terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "update_sg_rules" {
  source            = "./modules/update_security_group_rules"
  security_group_id = "sg-093ddc2dfbf772209"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0", "10.0.0.0/16"]
      description = "Allow HTTP alternative"
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
      description = "Allow MySQL"
    },
    {
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow DNS"
    },
   {
      from_port   = 389
      to_port     = 389
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow "
    },
{
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow HTTP"
},


  ]
}

module "update_route_table" {
  source         = "./modules/update_route_table_routes"
  route_table_id = "rtb-0708ea2a82fbaeba5"

  routes = [
    {
      name                    = "route-to-subnet-2"
      destination_cidr_block = "10.0.2.0/24"
      gateway_id             = "igw-02f7dc84a8b97cb60"
    },
    {
      name                    = "route-to-subnet-3"
      destination_cidr_block = "10.0.3.0/24"
      gateway_id             = "igw-02f7dc84a8b97cb60"
    },
    {
      name                    = "route-to-subnet-4"
      destination_cidr_block = "10.0.4.0/24"
      gateway_id             = "igw-02f7dc84a8b97cb60"
    },
{
  name                    = "route-to-subnet-5"
  destination_cidr_block = "10.0.5.0/24"
  gateway_id             = "igw-02f7dc84a8b97cb60"
},

  ]
}
