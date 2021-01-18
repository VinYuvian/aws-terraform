resource "aws_security_group_rule" "ssh"{
    security_group_id = aws_security_group.public-sg.id
    to_port = 22
    from_port = 22
    protocol = "TCP"
    cidr_blocks = ["43.241.120.3/32"]
    type = "ingress"
}

resource "aws_security_group" "public-sg"{
    vpc_id = aws_vpc.vpc.id 
    ingress{
        to_port = 80
        from_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        to_port = "0"
        from_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "private-sg"{
    vpc_id = aws_vpc.vpc.id 
    ingress{
        to_port = 22
        from_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        to_port = "0"
        from_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}