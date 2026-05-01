terraform { required_version=">= 1.6.0" required_providers { azurerm={source="hashicorp/azurerm",version="~> 3.110"} aws={source="hashicorp/aws",version="~> 5.50"} google={source="hashicorp/google",version="~> 5.30"} } }
provider "azurerm" { features {} }
provider "aws" { region=var.aws_region }
provider "google" { project=var.gcp_project_id region=var.gcp_region }
