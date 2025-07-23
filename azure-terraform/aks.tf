
# Cluster AKS pour les services SaaS de Cyna
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cyna"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "cyna-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
