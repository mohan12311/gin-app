provider "aws" {
    region = var.aws_region
}

resource "aws_key_pair" "my_key" {
    key_name = var.key_name
    public_key = file(var.public_key_path)
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"
    # 외부에서 ec2로 들어오는 트래픽
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Classless Inter-Domain Routing
    }
    # ec2에서 외부로 나가는 트래픽
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    associate_public_ip_address = true

    tags = {
        name = "devops-portfolio"
    }
}
