module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
  depends_on       = [module.resource_group]
}

module "subnet" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_network]
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.resource_group]
}

module "linux_virtual_machine" {
  source                 = "../../modules/azurerm_linux_virtual_machine"
  linux_virtual_machines = var.linux_virtual_machines
  depends_on             = [module.subnet, module.public_ip]
}