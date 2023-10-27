resource "aws_security_group" "public_https" {
  name        = "public_https"
  description = "Allow https inbound traffic"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "public_https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "public_registration"
    from_port        = 1515
    to_port          = 1515
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "public_communication"
    from_port        = 1514
    to_port          = 1514
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_security_group" "private_https" {
  name        = "private_https"
  description = "Allow https inbound traffic from vpn"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "private_https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}


resource "aws_security_group" "alb_to_k8s" {
  name        = "alb_to_k8s"
  description = "Allow ALB to communicate with worker nodes"
  vpc_id      = aws_vpc.redspace_vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "ssh_from_vpn" {
  name        = "ssh_from_vpn"
  description = "Allow SSH inbound traffic from vpn"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "SSH from vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "public_ssh_to_vpn" {
  name        = "public_ssh_to_vpn"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "public_ssh_to_vpn"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_security_group" "public_vpn_1194" {
  name        = "public_vpn_1194"
  description = "Allow VPN inbound traffic"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "public_vpn_1194"
    from_port        = 1194
    to_port          = 1194
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "kubectl_from_vpn" {
  name        = "kubectl_from_vpn"
  description = "Allow kubectl inbound traffic"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "kubectl_from_vpn"
    from_port        = 0
    to_port          = 0
    protocol         = "TCP"
    cidr_blocks      = [aws_vpc.redspace_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "k8s_from_alb" {
  name        = "k8s_from_alb"
  description = "Allow k8s inbound traffic from alb"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "k8s-from-alb"
    from_port        = 0
    to_port          = 65535
    protocol         = "TCP"
    security_groups = [aws_security_group.alb_to_k8s.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_security_group" "k8s_from_ops_k8s" {
  name        = "k8s_from_ops_k8s"
  description = "Allow k8s inbound traffic from k8s"
  vpc_id      = aws_vpc.redspace_vpc.id

  ingress {
    description      = "k8s-from-k8s_cidr"
    from_port        = 0
    to_port          = 65535
    protocol         = "TCP"
    cidr_blocks      = ["10.0.0.0/8"]
    security_groups = [aws_security_group.alb_to_k8s.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}