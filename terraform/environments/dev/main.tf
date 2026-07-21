module "network" {

  source = "../../modules/network"

  vnet_name = "dev-vnet"

  subnet_name = "dev-subnet"

  resource_group_name = "rg-dev"

  location = "westeurope"

  address_space = ["10.0.0.0/16"]

  subnet_prefixes = ["10.0.1.0/24"]
}

module "web_vm" {

  source = "../../modules/vm"

  vm_name = "dev-web"

  resource_group_name = "rg-dev"

  location = "westeurope"

  admin_username = "azureuser"

  public_key_path = "~/.ssh/id_rsa.pub"

  subnet_id = module.network.subnet_id
}
