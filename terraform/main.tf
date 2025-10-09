provider "azurerm" {
features {}
}


resource "azurerm_resource_group" "rg" {
name = var.resource_group_name
location = var.location
}


resource "azurerm_kubernetes_cluster" "aks" {
name = var.aks_name
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
dns_prefix = var.aks_dns_prefix


default_node_pool {
name = "default"
node_count = var.node_count
vm_size = var.node_vm_size
}


identity {
type = "SystemAssigned"
}


linux_profile {
admin_username = "azureuser"
ssh_key {
key_data = var.ssh_public_key
}
}
}


output "resource_group_name" {
value = azurerm_resource_group.rg.name
}


output "aks_cluster_name" {
value = azurerm_kubernetes_cluster.aks.name
}
