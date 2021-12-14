# terraform-vm_qemu-basic
Deploying basic VM into Proxmox with Terraform

Initalise terraform
```bash
terraform init
```

Create a tfvars file and populate it with your variables
```bash
cat << 'EOF' > terraform-vm_qemu-basic.auto.tfvars
pm_api_url = "https://<PROXMOX IP>:8006/api2/json"
pm_user = "root@pam"
pm_password = "root@pam"
EOF
```

Creates an execution plan to preview the changes
```bash
terraform plan
```

Apply the proposed changes
```bash
terraform apply
```

To delete all remote objects managed by a particular Terraform configuration
```bash
terraform destroy
```
