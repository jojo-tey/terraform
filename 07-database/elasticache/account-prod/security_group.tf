# Security Group for redis elasticache
resource "aws_security_group" "account_redis" {
  name        = "account-redis-${data.terraform_remote_state.vpc.outputs.vpc_name}"
  description = "account ElasticCache Redis Security Group"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  # It is recommanded to create new ingress block 
  # even though port is same in order to distinguish the usage... 
  ingress {
    # Please do not use default port for security.
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [] # Please add security group IDs
    description     = "Internal redis service port from account application"
  }

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [] # Please add security group IDs 
    description     = "Internal redis service port from xxx-vpc"
  }

  egress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["10.${data.terraform_remote_state.vpc.outputs.cidr_numeral}.0.0/16"]
    description = "Internal redis service port outbound"
  }

  tags = {
    Name    = "account-redis-${data.terraform_remote_state.vpc.outputs.vpc_name}-sg"
    project = "account"
    role    = "redis"
    stack   = data.terraform_remote_state.vpc.outputs.vpc_name
  }
}
