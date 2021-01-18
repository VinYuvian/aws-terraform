resource "aws_db_instance" "rds"{
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.20"
    instance_class = "db.t2.micro"
    name = "project_db"
    username = "master"
    password = "master"
    availability_zone = "ap-south-1a"
    backup_retention_period = 7

}