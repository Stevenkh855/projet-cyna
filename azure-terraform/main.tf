
# Fournit l'accès à Azure via Terraform
provider "azurerm" {
  features {}
  subscription_id = "b5d7bb3d-0739-44b6-99cd-5dc02d3fb57a"
}

# Crée le groupe de ressources principal
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

