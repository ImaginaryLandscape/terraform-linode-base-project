output "node_balancer_ip_hostname" {
  value = module.nodebalancer.node_balancer_ip_hostname
}

output "node_balancer_ip" {
  value = module.nodebalancer.node_balancer_ip
}

output "db_servers_public_ips" {
  value = module.dbserver.db_servers_public_ips
}
output "web_servers_public_ips" {
  value = module.webserver.web_servers_public_ips
}

output "db_servers_private_ips" {
  value = module.dbserver.db_servers_private_ips
}
output "web_servers_private_ips" {
  value = module.webserver.web_servers_private_ips
}

output "web_servers_passwd" {
  value = module.webserver.web_servers_passwd
}
output "db_servers_passwd" {
  value = module.dbserver.db_servers_passwd
}
