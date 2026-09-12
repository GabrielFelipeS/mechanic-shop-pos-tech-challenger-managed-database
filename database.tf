resource "aws_db_subnet_group" "postgres" {
  name       = "${var.project_name}-postgres"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-postgres"
  }
}

resource "aws_security_group" "postgres" {
  name        = "${var.project_name}-postgres"
  description = "Allows PostgreSQL traffic only from the shared application VPC."
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL from application VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
  identifier                = "${var.project_name}-postgres"
  engine                    = "postgres"
  engine_version            = "16"
  instance_class            = "db.t3.micro"
  allocated_storage         = 20
  max_allocated_storage     = 100
  storage_type              = "gp3"
  storage_encrypted         = true
  db_name                   = var.database_name
  username                  = var.database_username
  password                  = var.database_password
  port                      = 5432
  publicly_accessible       = false
  multi_az                  = false
  backup_retention_period   = 7
  deletion_protection       = false
  skip_final_snapshot       = true

  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [aws_security_group.postgres.id]

  tags = {
    Name = "${var.project_name}-postgres"
  }
}
