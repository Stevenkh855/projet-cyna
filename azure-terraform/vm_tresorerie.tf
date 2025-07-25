
# Interface réseau pour le serveur de gestion de la trésorerie
resource "azurerm_network_interface" "nic_tresorerie" {
  name                = "nic-tresorerie"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.backend.id
    private_ip_address_allocation = "Dynamic"
  }
}

# VM Oracle Linux avec ressources élevées pour la gestion financière
resource "azurerm_linux_virtual_machine" "vm_tresorerie" {
  name                = "vm-tresorerie"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D8s_v3" # 8 vCPU, 64 Go RAM
  admin_username      = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic_tresorerie.id]

# Configure l'accès SSH administrateur 
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("C:\\Users\\administrateur\\.ssh\\id_ed25519.pub")
  }

# Configure le disque système de la machine
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 2150
  }

# Specifie l'image source pour la création de la vm
  source_image_reference {
    publisher = "Oracle"
    offer     = "Oracle-Linux"
    sku       = "8.6"
    version   = "latest"
  }
}
