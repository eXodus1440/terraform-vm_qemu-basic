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
  vmid = "${count.index + 1001}"
  count = var.vm_count
  name = "vm-basic-${count.index + 1001}"
  target_node = var.target_node
  clone = "ubuntu-server-20.04-lts"
  full_clone = true

  //agent    = 1
  os_type    = "ubuntu"
  sockets    = 1
  cores      = 1
  //cpu      = "host"
  memory     = 2048
  scsihw     = "virtio-scsi-pci"
  boot       = "c"
  bootdisk   = "scsi0"

  vga {
    type = "serial0"
  }

  disk {
    size = "8G"
    type = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  // Cloud Init Settings
  // https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/guides/cloud_init
  ciuser = var.ciuser
  cipassword = var.cipassword
  searchdomain = var.searchdomain
  nameserver = var.nameserver
  sshkeys = file("~/.ssh/steve_rsa.pub")
  ipconfig0 = var.ipconfig0

  // Provisioner connection settings 
  // https://www.terraform.io/docs/language/resources/provisioners/connection.html
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/steve_rsa")
    host        = var.ssh_host
  }

  provisioner "remote-exec" {
    inline = [
      "ip a"
    ]
  }
}

