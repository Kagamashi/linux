variable "location" {
  description = "Azure region where the resources will be created."
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group for the VMs."
  default     = "vm-learning-rg"
}

variable "admin_username" {
  description = "Admin username for the virtual machines."
  type        = string
  default     = "adminuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  description = "Size of the virtual machines."
  default     = "Standard_B2s"
}
