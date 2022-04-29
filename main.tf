# module invocations
module "nodebalancer" {
  # source = "./modules/terraform-linode-module-nodebalancer"
  source                  = "git@github.com:marattm/terraform-linode-module-nodebalancer.git"
  region                  = var.LN_REGION
  node_count              = var.linode_web_instance_node_count
  web_servers_private_ips = module.webserver.web_servers_private_ips
  tags                    = var.linode_nodebalancer_tags
  stickiness              = var.linode_nodebalancer_stickiness
  algorithm               = var.linode_nodebalancer_algorithm
  SITE                    = var.SITE
  ENV                     = var.ENV
}

module "webserver" {
  # source = "./modules/terraform-linode-module-webserver"
  source          = "git@github.com:marattm/terraform-linode-module-webserver.git"
  public_key_path = var.public_key_path
  root_password   = var.root_password
  region          = var.LN_REGION
  group           = var.linode_web_instance_group
  image           = var.linode_web_instance_image
  instance_type   = var.linode_web_instance_type
  node_count      = var.linode_web_instance_node_count
  tags            = var.linode_web_instance_tags
  SITE            = var.SITE
  ID              = var.ID
  DOMAIN          = var.DOMAIN
}

module "dbserver" {
  # source = "./modules/terraform-linode-module-dbserver"
  source          = "git@github.com:marattm/terraform-linode-module-dbserver.git"
  public_key_path = var.public_key_path
  root_password   = var.root_password
  region          = var.LN_REGION
  group           = var.linode_db_instance_group
  image           = var.linode_db_instance_image
  instance_type   = var.linode_db_instance_type
  node_count      = var.linode_db_instance_node_count
  tags            = var.linode_db_instance_tags
  SITE            = var.SITE
  ID              = var.ID
  DOMAIN          = var.DOMAIN
}

module "network" {
  # source = "./modules/terraform-linode-module-network"
  source                  = "git@github.com:marattm/terraform-linode-module-network.git"
  linode_ids              = module.webserver.web_linode_ids
  db_linode_ids           = module.dbserver.db_linode_ids
  web_servers_private_ips = module.webserver.web_servers_private_ips
  SITE                    = var.SITE
  ENV                     = var.ENV
}
