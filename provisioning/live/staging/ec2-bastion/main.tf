# Data source to fetch the latest Ubuntu 22.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's AWS account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "ec2_instance" {
  #source  = "terraform-aws-modules/ec2-instance/aws"
  source = "../../../provisioning/tf-aws-modules/ec2"

  name = "single-instance"

  #ami                    = "ami-06a2e6561950f5040"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = "triadip-aws"
  monitoring             = true
  vpc_security_group_ids = ["sg-0de89194b99be390f"]
  subnet_id              = "subnet-044ac036c181aedfa"

  root_block_device = [{
    volume_type           = "gp3" # General Purpose SSD
    volume_size           = 30    # 30GB disk size
    delete_on_termination = true
    encrypted             = true # Encrypt the volume
  }]

  tags = {
    Terraform   = "true"
    Environment = "stg"
  }
}