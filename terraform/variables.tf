variable "resource_group_name" { default = "devops-rg" }
variable "location" { default = "eastasia" }
variable "aks_name" { default = "devops-aks" }
variable "aks_dns_prefix" { default = "devopsaks" }
variable "node_count" { default = 2 }
variable "node_vm_size" { default = "Standard_B2s" }
variable "ssh_public_key" { description = "Your SSH public key (for node access)" }
