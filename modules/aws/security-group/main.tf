variable "name" { type=string }
variable "vpc_id" { type=string }
variable "tags" { type=map(string) default={} }
resource "aws_security_group" "this" { name=var.name vpc_id=var.vpc_id egress { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] } tags=merge(var.tags,{Name=var.name}) }
output "id" { value=aws_security_group.this.id }
