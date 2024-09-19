provider "aws" {
  region = "ap-southeast-3"
}

module "vpc" {
  #source = "terraform-aws-modules/vpc/aws"
  source = "../../../provisioning/tf-aws-modules/vpc/"

  name = "dev-vpc-b13"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-3a","ap-southeast-3b"]
  private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets  = ["10.0.11.0/24","10.0.22.0/24"]

  #map_public_ip_on_launch = true

  enable_nat_gateway = true
  single_nat_gateway  = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}