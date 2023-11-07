resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "ai_rds_subnet_group"
  description = "subnet group for AI rds"
  subnet_ids  = ["list"]

  tags = var.tags
}

resource "aws_security_group" "rds_ai_security_group" {
  name        = "rds_ai_security_group"
  description = "security group for AI rds"
  vpc_id      = var.network_vpc_id

  ingress {
    description = "allow traffic to RDS"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = [var.network_cidr_block]
  }

  tags = var.tags
}


resource "aws_db_instance" "AI_db" {
  allocated_storage       = var.allocated_storage
  engine                  = "sqlserver-se"
  instance_class          = var.rds_instance_class
  license_model           = "license-included"
  storage_type            = "gp2"
  engine_version          = var.engine_version
  multi_az                = false
  identifier              = "dev-mssql-rds"
  depends_on              = [aws_db_subnet_group.rds_subnet_group]
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = [aws_security_group.rds_ai_security_group]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group
  backup_retention_period = 5
  skip_final_snapshot     = true

  tags = var.tags

}
