variable "environment" { type = string }
variable "owner" { type = string }
variable "cost_center" { type = string }
variable "application" { type = string }
variable "extra_tags" { type = map(string) default = {} }
locals { tags = merge({ environment=var.environment, owner=var.owner, cost_center=var.cost_center, application=var.application, managed_by="terraform" }, var.extra_tags) }
output "tags" { value = local.tags }
