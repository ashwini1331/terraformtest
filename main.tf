provider "aws" {
  region = "ap-southeast-1"
  access_key = "AKIAX63XKS6DL2GPNV52"
  secret_key ="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"
}

resource "aws_instance" "main" {
 ami = "ami-0470e33cd681b2476"
 instance_type = "t2.micro" 
tags = {
    Name = "HelloWorld"
  }
 key_name = "tf"
  security_groups              = [
        "default"
    ]
     root_block_device {
        volume_size           = 10
     }
     ebs_block_device {
       device_name = "/dev/sdh"
       volume_size = 6
     }
}
resource "aws_eip" "lb" {
  instance = "${aws_instance.main.id}"
}
resource "aws_security_group" "allow_tls1" {
  name        = "allow_tls1"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    from_port   = 20
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 20
    to_port     = 25
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 400
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 400
    to_port     = 443
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdk"
  volume_id = "${aws_ebs_volume.main.id}"
  instance_id = "${aws_instance.main.id}"

}
resource "aws_ebs_volume" "main" {
  availability_zone = "ap-south-1a"
  size = 20
  type = "standard"

}

resource "aws_api_gateway_api_key" "MyDemoApiKey" {
  name = "demo"
  description = "Managed by Terraform"
  enabled = "true"
}


