variable "name" { type=string }
variable "subnet_ids" { type=list(string) }
variable "tags" { type=map(string) default={} }
resource "aws_iam_role" "cluster" { name="${var.name}-role" assume_role_policy=jsonencode({Version="2012-10-17",Statement=[{Action="sts:AssumeRole",Effect="Allow",Principal={Service="eks.amazonaws.com"}}]}) }
resource "aws_iam_role_policy_attachment" "cluster" { role=aws_iam_role.cluster.name policy_arn="arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" }
resource "aws_eks_cluster" "this" { name=var.name role_arn=aws_iam_role.cluster.arn vpc_config { subnet_ids=var.subnet_ids endpoint_private_access=true endpoint_public_access=false } depends_on=[aws_iam_role_policy_attachment.cluster] tags=var.tags }
output "name" { value=aws_eks_cluster.this.name }
