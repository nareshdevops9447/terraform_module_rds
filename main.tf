resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  identifier           = var.identifier
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_type
  username             = var.username
  db_subnet_group_name = var.db_subnet_group_name
  #db_security_group_ids = var.db_security_group_ids
  password = random_password.password.result
  vpc_security_group_ids = var.vpc_security_group_ids
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"

}

# store password in secret manager
resource "aws_secretsmanager_secret" "rds" {
  name = var.secret_name
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "rds" {
  secret_id     = aws_secretsmanager_secret.rds.id
  secret_string = random_password.password.result
  tags = var.tags
}



