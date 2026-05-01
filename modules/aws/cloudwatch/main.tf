variable "name" { type=string }
variable "tags" { type=map(string) default={} }
resource "aws_cloudwatch_log_group" "this" { name=var.name retention_in_days=30 tags=var.tags }
output "arn" { value=aws_cloudwatch_log_group.this.arn }
