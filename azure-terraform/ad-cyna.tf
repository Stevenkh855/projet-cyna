resource "proxmox_vm_qemu" "srv_demo_windows" {
  name        = "AD-Cyna"
  desc        = "AD-Cyna Windows server 2022 déployée depuis un template cloud-init"
  vmid        = 410
  target_node = "pvegen"

  clone       = "WS2022-template"
  os_type     = "cloud-init"
  
  memory      = 8192
  sockets     = 1
  cores       = 2
  cpu_type    = "host"

  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    slot    = "scsi0"
    type    = "disk"
    storage = "local-lvm"
    size    = "60G"
  }

  ipconfig0   = "ip=192.168.30.100/24,gw=192.168.30.1"
  nameserver  = "1.1.1.1"

  ciuser      = var.ciuser
  cipassword  = var.cipassword

  ci_wait     = 60
}
