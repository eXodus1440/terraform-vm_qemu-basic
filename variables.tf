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
