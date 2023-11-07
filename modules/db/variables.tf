variable "rds_instance_class" {
  default = "db.t4g.medium"
}

variable "allocated_storage" {
  default = 15
}

variable "network_vpc_id" {
  type = string
}

variable "network_cidr_block" {
  type = string
}
variable "engine_version" {
  default = "14.00.3460.9.v1"
}
variable "db_username" {
  description = "username db"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "db password"
  type        = string
  sensitive   = true
}
variable "tags" {
  type = map(string)
}
