resource "aws_db_instance" "test_rds" {
  allocated_storage     = 50
  max_allocated_storage = 80
  engine                = "postgres"
  engine_version        = "13.1"
  instance_class        = "db.t3.small"
  name                  = "testDB"
  username              = "guestUser"
  password              = "testtest"
  vpc_security_group_ids = [
    aws_security_group.blogPrivateSG.id,
  ]
  tags = {
    "name" = "testDB"
  }
}
