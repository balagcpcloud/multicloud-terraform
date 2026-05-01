variable "name" { type=string }
variable "cidr_block" { type=string }
variable "azs" { type=list(string) }
variable "public_subnets" { type=list(string) }
variable "private_subnets" { type=list(string) }
variable "tags" { type=map(string) default={} }
resource "aws_vpc" "this" { cidr_block=var.cidr_block enable_dns_support=true enable_dns_hostnames=true tags=merge(var.tags,{Name=var.name}) }
resource "aws_internet_gateway" "this" { vpc_id=aws_vpc.this.id tags=merge(var.tags,{Name="${var.name}-igw"}) }
resource "aws_subnet" "public" { count=length(var.public_subnets) vpc_id=aws_vpc.this.id cidr_block=var.public_subnets[count.index] availability_zone=var.azs[count.index] map_public_ip_on_launch=true tags=merge(var.tags,{Name="${var.name}-public-${count.index+1}"}) }
resource "aws_subnet" "private" { count=length(var.private_subnets) vpc_id=aws_vpc.this.id cidr_block=var.private_subnets[count.index] availability_zone=var.azs[count.index] tags=merge(var.tags,{Name="${var.name}-private-${count.index+1}"}) }
output "vpc_id" { value=aws_vpc.this.id }
output "private_subnet_ids" { value=aws_subnet.private[*].id }
