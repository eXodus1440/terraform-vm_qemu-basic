// Provider config - create a tfvars file and populate it with your connection details
variable "pm_api_url" { default = "https://<PROXMOX IP>:8006/api2/json" }
variable "pm_user" { default = "root@pam" }
variable "pm_password" { 
  default = "root@pam" 
  sensitive = true 
}

// Resource config
variable "target_node" { default = "pve1" }
variable "vm_count" { default = "1" }
variable "searchdomain" { default = "local" }
variable "nameserver" { default = "8.8.8.8" }
variable "ipconfig0" { default = "ip=192.168.0.101/24,gw=192.168.0.1" }
variable "ssh_host" { default = "192.168.0.101" }

// Cloud-init config
variable "ciuser" { default = "ubuntu" }
variable "cipassword" { 
  default = "BasicVMqemu"
  sensitive = true
}
