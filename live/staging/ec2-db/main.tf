module "ec2_instance" {
  #source  = "terraform-aws-modules/ec2-instance/aws"
  source = "../../../provisioning/tf-aws-modules/ec2"

  name = "single-instance"

  ami                    = "ami-06a2e6561950f5040"
  instance_type          = "t3.micro"
  key_name               = "devops"
  monitoring             = true
  vpc_security_group_ids = ["sg-0dd8a571f32803655"]
  subnet_id              = "subnet-0ae1ee58bc719d4aa"

  tags = {
    Terraform   = "true"
    Environment = "stg"
  }
}