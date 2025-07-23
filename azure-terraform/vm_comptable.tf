
# Interface réseau pour le serveur de comptabilité
resource "azurerm_network_interface" "nic_comptable" {
  name                = "nic-comptable"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.backend.id
    private_ip_address_allocation = "Dynamic"
  }
}

# VM Oracle Linux pour héberger l'application comptable avec Oracle DB
resource "azurerm_linux_virtual_machine" "vm_comptable" {
  name                = "vm-comptable"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D4s_v3" # 4 vCPU, 32 Go RAM
  admin_username      = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic_comptable.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 1150
  }

  source_image_reference {
    publisher = "Oracle"
    offer     = "Oracle-Linux"
    sku       = "8.6"
    version   = "latest"
  }
}
