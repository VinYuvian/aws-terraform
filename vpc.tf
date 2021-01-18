resource "aws_vpc" "vpc"{
    cidr_block = "${var.vpc_cidr}/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags={
        Name = "vpc"
    }
}