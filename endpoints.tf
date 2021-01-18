resource "aws_vpc_endpoint" "s3"{
    service_name = "com.amazonaws.ap-south-1.s3"
    vpc_id = aws_vpc.vpc.id
    route_table_ids = [aws_route_table.pvt_rtable.id,aws_route_table.public_rtable.id]
    tags={
        Name = "s3"
    }
}
