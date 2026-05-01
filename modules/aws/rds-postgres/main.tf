variable "identifier" { type=string }
variable "subnet_ids" { type=list(string) }
variable "security_group_ids" { type=list(string) }
variable "username" { type=string }
variable "password" { type=string sensitive=true }
variable "tags" { type=map(string) default={} }
resource "aws_db_subnet_group" "this" { name="${var.identifier}-subnets" subnet_ids=var.subnet_ids tags=var.tags }
resource "aws_db_instance" "this" { identifier=var.identifier engine="postgres" engine_version="15" instance_class="db.t4g.micro" allocated_storage=20 db_subnet_group_name=aws_db_subnet_group.this.name vpc_security_group_ids=var.security_group_ids username=var.username password=var.password skip_final_snapshot=true storage_encrypted=true backup_retention_period=7 publicly_accessible=false tags=var.tags }
output "endpoint" { value=aws_db_instance.this.endpoint }
