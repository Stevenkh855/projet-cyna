provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "k8s_rg" {
  name     = "rg-k8s-cyna"
  location = "France Central"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cyna"
  location            = azurerm_resource_group.k8s_rg.location
  resource_group_name = azurerm_resource_group.k8s_rg.name
  dns_prefix          = "aks-cyna"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
