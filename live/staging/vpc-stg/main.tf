module "vpc" {
  #source = "terraform-aws-modules/vpc/aws"
  source = "../../../provisioning/tf-aws-modules/vpc/"

  name = "stg-vpc-b13"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-3a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.11.0/24"]

  enable_nat_gateway = false
  single_nat_gateway  = false
  one_nat_gateway_per_az = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "stg"
  }
}