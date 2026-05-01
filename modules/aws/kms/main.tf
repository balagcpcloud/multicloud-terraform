variable "alias" { type=string }
variable "tags" { type=map(string) default={} }
resource "aws_kms_key" "this" { description=var.alias deletion_window_in_days=10 enable_key_rotation=true tags=var.tags }
resource "aws_kms_alias" "this" { name="alias/${var.alias}" target_key_id=aws_kms_key.this.key_id }
output "arn" { value=aws_kms_key.this.arn }
