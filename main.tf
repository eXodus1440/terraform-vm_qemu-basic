terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.3"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_user = var.pm_user
  pm_password = var.pm_password
  // pm_tls_insecure = true
  // pm_parallel = 1
}

resource "proxmox_vm_qemu" "basic" {
  count = var.vm_count
  name = "vm-basic-${count.index + 1001}"
  target_node = var.target_node
  //target_node = "pve1"
  vmid = "${count.index + 1001}"

  clone = "ubuntu-server-20.04-lts"
  full_clone = true

  /*
  agent    = 1
  os_type  = "ubuntu"
  cores    = 4
  sockets  = "1"
  cpu      = "host"
  memory   = 8192
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  */

  disk {
    size = "8G"
    type = "scsi"
    storage = "local-lvm"
  }

  network {
    //id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

/*
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0 = "ip=192.168.0.1${count.index + 1}/24,gw=<GW>"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
*/

}

