
# Fournit l'accès à Azure via Terraform
provider "azurerm" {
  features {}
}

# Crée le groupe de ressources principal
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

