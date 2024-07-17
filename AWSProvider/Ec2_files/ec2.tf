provider "aws"{
    region = "***********"
    access_key = "***********"
    secret_key = "***********"
}

resource "aws_key_pair" "keypairname" {
  public_key = "***********"
  key_name = "New-terraform-key"
}

variable "vpcid" {
type = string
  default = "vpc-58b34733"
}
resource "aws_security_group" "samplesggroup" {
  name = "samplesggroup"
  vpc_id = var.vpcid
 ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Ingress value"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Ingress value"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
}

resource "aws_instance" "terraforminstance" {
  ami = "ami-011c99152163a87ae"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypairname.key_name
  tags = {
      Name = "First Terraform Instance"
  }
}