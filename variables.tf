variable "LN_API_TOKEN" {
  description = "Linode APIv4 Access Token"
  sensitive   = true
}
variable "LN_REGION" {
  description = "Default Region for operations."
  # default = "ap-west"        # 1 - ap-west
  # default = "ca-central"     # 2 - ca-central
  # default = "ap-southeast"   # 3 - ap-southeast
  # default = "us-central"     # 4 - us-central
  # default = "us-west"        # 5 - us-west
  # default = "us-southeast"   # 6 - us-southeast
  default = "us-east" #  7 - us-east
  # default = "eu-west"        # 8 - eu-west
  # default = "ap-south"       # 9 - ap-south
  # default = "eu-central"     # 10 - eu-central
  # default = "ap-northeast "  # 11 - ap-northeast 
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}


variable "authorized_keys" {
  default = []
  type    = list(string)
}

variable "admin_user" {}

variable "ENV" {
  description = "Environment var."
  type        = string
  default     = "prod"
}

variable "DOMAIN" {
  description = "Root or subdomain."
  type        = string
}

variable "SITE" {
  description = "Site name of the project/app."
  type        = string
}
variable "ID" {
  description = "Id of the release, usually an int."
  type        = number
}


# WEB
variable "linode_web_instance_backups_enabled" {
  type    = bool
  default = false
}

variable "linode_web_instance_group" {
  type    = string
  default = "webservers"
}

variable "linode_web_instance_label" {
  default = "example_instance_label"
}

variable "linode_web_instance_image" {
  description = "Default Image to deploy to new Linodes."
  # default = "linode/almalinux8" # 1 - linode/almalinux8
  # default = "linode/alpine3.12" # 2 - linode/alpine3.12
  # default = "linode/alpine3.13" # 3 - linode/alpine3.13
  # default = "linode/alpine3.14" # 4 - linode/alpine3.14
  # default = "linode/alpine3.15" # 5 - linode/alpine3.15
  # default = "linode/arch" # 6 - linode/arch
  # default = "linode/centos7" # 7 - linode/centos7
  # default = "linode/centos-stream8" # 8 - linode/centos-stream8
  # default = "linode/centos-stream9" # 9 - linode/centos-stream9
  # default = "linode/debian10" # 10 - linode/debian10
  # default = "linode/debian11" # 11 - linode/debian11
  # default = "linode/debian9" # 12 - linode/debian9
  # default = "linode/fedora34" # 13 - linode/fedora34
  # default = "linode/fedora35" # 14 - linode/fedora35
  # default = "linode/gentoo" # 15 - linode/gentoo
  # default = "linode/debian11-kube-v1.20.15" # 16 - linode/debian11-kube-v1.20.15
  # default = "linode/debian9-kube-v1.20.7" # 17 - linode/debian9-kube-v1.20.7
  # default = "linode/debian9-kube-v1.21.1" # 18 - linode/debian9-kube-v1.21.1
  # default = "linode/debian11-kube-v1.21.9" # 19 - linode/debian11-kube-v1.21.9
  # default = "linode/debian9-kube-v1.22.2" # 20 - linode/debian9-kube-v1.22.2
  # default = "linode/debian11-kube-v1.22.6" # 21 - linode/debian11-kube-v1.22.6
  # default = "linode/debian11-kube-v1.23.4" # 22 - linode/debian11-kube-v1.23.4
  # default = "linode/opensuse15.3" # 23 - linode/opensuse15.3
  # default = "linode/rocky8" # 24 - linode/rocky8
  # default = "linode/slackware14.2" # 25 - linode/slackware14.2
  # default = "linode/slackware15.0" # 26 - linode/slackware15.0
  # default = "linode/ubuntu16.04lts" # 27 - linode/ubuntu16.04lts
  # default = "linode/ubuntu18.04" # 28 - linode/ubuntu18.04
  default = "linode/ubuntu20.04" # 29 - linode/ubuntu20.04
  # default = "linode/ubuntu21.10" # 30 - linode/ubuntu21.10
  # default = "linode/alpine3.11" # 31 - linode/alpine3.11
  # default = "linode/centos8" # 32 - linode/centos8
  # default = "linode/fedora33" # 33 - linode/fedora33
  # default = "linode/opensuse15.2" # 34 - linode/opensuse15.2
  # default = "linode/slackware14.1" # 35 - linode/slackware14.1
  # default = "linode/ubuntu21.04" # 36 - linode/ubuntu21.04
}

variable "linode_web_instance_node_count" {}

# variable "linode_web_instance_swap_size" {
#   #TODO: should be defined by the instance size using the var linode_type..
#   description = "Swap size in MB."
#   type        = number
#   default     = 1024
# }

variable "linode_web_instance_tags" {
  type    = list(string)
  default = ["prod", "web"]
}

variable "linode_web_instance_type" {
  description = "Default Type of Linode to deploy."
  default     = "g6-nanode-1" # 1 - g6-nanode-1
  # default = "g6-standard-1" # 2 - g6-standard-1
  # default = "g6-standard-2" # 3 - g6-standard-2
  # default = "g6-standard-4" # 4 - g6-standard-4
  # default = "g6-standard-6" # 5 - g6-standard-6
  # default = "g6-standard-8" # 6 - g6-standard-8
  # default = "g6-standard-16" # 7 - g6-standard-16
  # default = "g6-standard-20" # 8 - g6-standard-20
  # default = "g6-standard-24" # 9 - g6-standard-24
  # default = "g6-standard-32" # 10 - g6-standard-32
  # default = "g7-highmem-1" # 11 - g7-highmem-1
  # default = "g7-highmem-2" # 12 - g7-highmem-2
  # default = "g7-highmem-4" # 13 - g7-highmem-4
  # default = "g7-highmem-8" # 14 - g7-highmem-8
  # default = "g7-highmem-16" # 15 - g7-highmem-16
  # default = "g6-dedicated-2" # 16 - g6-dedicated-2
  # default = "g6-dedicated-4" # 17 - g6-dedicated-4
  # default = "g6-dedicated-8" # 18 - g6-dedicated-8
  # default = "g6-dedicated-16" # 19 - g6-dedicated-16
  # default = "g6-dedicated-32" # 20 - g6-dedicated-32
  # default = "g6-dedicated-48" # 21 - g6-dedicated-48
  # default = "g6-dedicated-50" # 22 - g6-dedicated-50
  # default = "g6-dedicated-56" # 23 - g6-dedicated-56
  # default = "g6-dedicated-64" # 24 - g6-dedicated-64
  # default = "g1-gpu-rtx6000-1" # 25 - g1-gpu-rtx6000-1
  # default = "g1-gpu-rtx6000-2" # 26 - g1-gpu-rtx6000-2
  # default = "g1-gpu-rtx6000-3" # 27 - g1-gpu-rtx6000-3
  # default = "g1-gpu-rtx6000-4" # 28 - g1-gpu-rtx6000-4
}

# DB
variable "linode_db_instance_backups_enabled" {
  type    = bool
  default = false
}

variable "linode_db_instance_group" {
  type    = string
  default = "dbservers"
}

variable "linode_db_instance_label" {
  default = "example_db_instance_label"
}

variable "linode_db_instance_image" {
  description = "Default Image to deploy to new Linodes."
  # default = "linode/almalinux8" # 1 - linode/almalinux8
  # default = "linode/alpine3.12" # 2 - linode/alpine3.12
  # default = "linode/alpine3.13" # 3 - linode/alpine3.13
  # default = "linode/alpine3.14" # 4 - linode/alpine3.14
  # default = "linode/alpine3.15" # 5 - linode/alpine3.15
  # default = "linode/arch" # 6 - linode/arch
  # default = "linode/centos7" # 7 - linode/centos7
  # default = "linode/centos-stream8" # 8 - linode/centos-stream8
  # default = "linode/centos-stream9" # 9 - linode/centos-stream9
  # default = "linode/debian10" # 10 - linode/debian10
  # default = "linode/debian11" # 11 - linode/debian11
  # default = "linode/debian9" # 12 - linode/debian9
  # default = "linode/fedora34" # 13 - linode/fedora34
  # default = "linode/fedora35" # 14 - linode/fedora35
  # default = "linode/gentoo" # 15 - linode/gentoo
  # default = "linode/debian11-kube-v1.20.15" # 16 - linode/debian11-kube-v1.20.15
  # default = "linode/debian9-kube-v1.20.7" # 17 - linode/debian9-kube-v1.20.7
  # default = "linode/debian9-kube-v1.21.1" # 18 - linode/debian9-kube-v1.21.1
  # default = "linode/debian11-kube-v1.21.9" # 19 - linode/debian11-kube-v1.21.9
  # default = "linode/debian9-kube-v1.22.2" # 20 - linode/debian9-kube-v1.22.2
  # default = "linode/debian11-kube-v1.22.6" # 21 - linode/debian11-kube-v1.22.6
  # default = "linode/debian11-kube-v1.23.4" # 22 - linode/debian11-kube-v1.23.4
  # default = "linode/opensuse15.3" # 23 - linode/opensuse15.3
  # default = "linode/rocky8" # 24 - linode/rocky8
  # default = "linode/slackware14.2" # 25 - linode/slackware14.2
  # default = "linode/slackware15.0" # 26 - linode/slackware15.0
  # default = "linode/ubuntu16.04lts" # 27 - linode/ubuntu16.04lts
  # default = "linode/ubuntu18.04" # 28 - linode/ubuntu18.04
  default = "linode/ubuntu20.04" # 29 - linode/ubuntu20.04
  # default = "linode/ubuntu21.10" # 30 - linode/ubuntu21.10
  # default = "linode/alpine3.11" # 31 - linode/alpine3.11
  # default = "linode/centos8" # 32 - linode/centos8
  # default = "linode/fedora33" # 33 - linode/fedora33
  # default = "linode/opensuse15.2" # 34 - linode/opensuse15.2
  # default = "linode/slackware14.1" # 35 - linode/slackware14.1
  # default = "linode/ubuntu21.04" # 36 - linode/ubuntu21.04
}

variable "linode_db_instance_node_count" {
  type = number
}

# variable "linode_db_instance_swap_size" {
#   #TODO: should be defined by the instance size using the var linode_type..
#   description = "Swap size in MB."
#   type        = number
#   default     = 1024
# }

variable "linode_db_instance_tags" {
  type    = list(string)
  default = ["prod", "database"]
}

variable "linode_db_instance_type" {
  description = "Default Type of Linode to deploy."
  default     = "g6-nanode-1" # 1 - g6-nanode-1
  # default = "g6-standard-1" # 2 - g6-standard-1
  # default = "g6-standard-2" # 3 - g6-standard-2
  # default = "g6-standard-4" # 4 - g6-standard-4
  # default = "g6-standard-6" # 5 - g6-standard-6
  # default = "g6-standard-8" # 6 - g6-standard-8
  # default = "g6-standard-16" # 7 - g6-standard-16
  # default = "g6-standard-20" # 8 - g6-standard-20
  # default = "g6-standard-24" # 9 - g6-standard-24
  # default = "g6-standard-32" # 10 - g6-standard-32
  # default = "g7-highmem-1" # 11 - g7-highmem-1
  # default = "g7-highmem-2" # 12 - g7-highmem-2
  # default = "g7-highmem-4" # 13 - g7-highmem-4
  # default = "g7-highmem-8" # 14 - g7-highmem-8
  # default = "g7-highmem-16" # 15 - g7-highmem-16
  # default = "g6-dedicated-2" # 16 - g6-dedicated-2
  # default = "g6-dedicated-4" # 17 - g6-dedicated-4
  # default = "g6-dedicated-8" # 18 - g6-dedicated-8
  # default = "g6-dedicated-16" # 19 - g6-dedicated-16
  # default = "g6-dedicated-32" # 20 - g6-dedicated-32
  # default = "g6-dedicated-48" # 21 - g6-dedicated-48
  # default = "g6-dedicated-50" # 22 - g6-dedicated-50
  # default = "g6-dedicated-56" # 23 - g6-dedicated-56
  # default = "g6-dedicated-64" # 24 - g6-dedicated-64
  # default = "g1-gpu-rtx6000-1" # 25 - g1-gpu-rtx6000-1
  # default = "g1-gpu-rtx6000-2" # 26 - g1-gpu-rtx6000-2
  # default = "g1-gpu-rtx6000-3" # 27 - g1-gpu-rtx6000-3
  # default = "g1-gpu-rtx6000-4" # 28 - g1-gpu-rtx6000-4
}

# NODE BALANCER

variable "linode_nodebalancer_stickiness" {
  type    = string
  default = "http_cookie"
}

variable "linode_nodebalancer_algorithm" {
  type    = string
  default = "leastconn"
  #   default = "roundrobin"
  #   default = "source"
}

variable "linode_nodebalancer_tags" {
  type    = list(string)
  default = ["dev", "loadblanacer"]
}
