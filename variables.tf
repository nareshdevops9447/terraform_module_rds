variable "allocated_storage" {

}

variable "db_name" {

}

variable "identifier" {

}

variable "engine" {

}

variable "engine_version" {

}

variable "instance_type" {

}

variable "username" {

}

variable "db_subnet_group_name" {

}

variable "vpc_security_group_ids" {
    type = list
}

variable "secret_name" {

}

variable "rds_tags" {
    default = {}
}

variable "tags" {

}

variable "rds_secret_arn" {
    default = "arn:aws:secretsmanager:us-east-1:872945671818:secret:timing/rds-password-secret-jvc47n"
}