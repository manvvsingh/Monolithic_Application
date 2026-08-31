resource_groups = {
  rg_dev_001 = {
    name     = "rg-dev-001"
    location = "eastus"
  }
}

virtual_networks = {
  vnet_dev_001 = {
    name                = "vnet-dev-001"
    resource_group_name = "rg-dev-001"
    location            = "eastus"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  frontend_subnet = {
    name                 = "Frontend-Subnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.0.1.0/24"]
  }
  backend_subnet = {
    name                 = "Backend-Subnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.0.2.0/24"]
  }
  database_subnet = {
    name                 = "Database-Subnet"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

public_ips = {
  pip_axion = {
    name                = "pip-axion-ui"
    resource_group_name = "rg-dev-001"
    location            = "eastus"
    allocation_method   = "Static"
  }
  pip_telemetry = {
    name                = "pip-telemetry-query"
    resource_group_name = "rg-dev-001"
    location            = "eastus"
    allocation_method   = "Static"
  }
  pip_ingestion = {
    name                = "pip-ingestion"
    resource_group_name = "rg-dev-001"
    location            = "eastus"
    allocation_method   = "Static"
  }
  pip_database = {
    name                = "pip-database"
    resource_group_name = "rg-dev-001"
    location            = "eastus"
    allocation_method   = "Static"
  }
}

linux_virtual_machines = {
  vm_axion = {
    name                 = "vm-axion-ui"
    resource_group_name  = "rg-dev-001"
    location             = "eastus"
    size                 = "Standard_B1s"
    admin_username       = "devopsadmin"
    admin_password       = "P@ssw01rd@123"
    subnet_name          = "Frontend-Subnet"
    virtual_network_name = "vnet-dev-001"
    public_ip_name       = "pip-axion-ui"
  }
  vm_telemetry = {
    name                 = "vm-telemetry-query"
    resource_group_name  = "rg-dev-001"
    location             = "eastus"
    size                 = "Standard_B1s"
    admin_username       = "devopsadmin"
    admin_password       = "P@ssw01rd@123"
    subnet_name          = "Backend-Subnet"
    virtual_network_name = "vnet-dev-001"
    public_ip_name       = "pip-telemetry-query"
  }
  vm_ingestion = {
    name                 = "vm-ingestion"
    resource_group_name  = "rg-dev-001"
    location             = "eastus"
    size                 = "Standard_B1s"
    admin_username       = "devopsadmin"
    admin_password       = "P@ssw01rd@123"
    subnet_name          = "Backend-Subnet"
    virtual_network_name = "vnet-dev-001"
    public_ip_name       = "pip-ingestion"
  }
  vm_database = {
    name                 = "vm-database"
    resource_group_name  = "rg-dev-001"
    location             = "eastus"
    size                 = "Standard_B1s"
    admin_username       = "devopsadmin"
    admin_password       = "P@ssw01rd@123"
    subnet_name          = "Database-Subnet"
    virtual_network_name = "vnet-dev-001"
    public_ip_name       = "pip-database"
  }
}
