resource "aws_subnet" "privateSubnets"{
	vpc_id=aws_vpc.vpc.id
	#count=3
    count = length(var.private)
    cidr_block= "${var.private[count.index]}/24"
	map_public_ip_on_launch="true"
	availability_zone="${var.region}${var.az[count.index]}"
	tags={
		Name="privateSubnet-${count.index}"
	}
}

resource "aws_subnet" "publicSubnets"{
	vpc_id=aws_vpc.vpc.id
	count = length(var.public)
	cidr_block= "${var.public[count.index]}/24"
	availability_zone="${var.region}${var.az[count.index]}"
	tags={
		Name="PrivateSubnet-${count.index}"
	}
}
