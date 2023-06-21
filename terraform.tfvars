# non-sensitives auto vars - default for all dev env

ENV        = "prod"
DOMAIN     = "live.imagescape.com"
admin_user = "imagescape"

linode_web_instance_group      = "webserver"
linode_web_instance_image      = "linode/ubuntu20.04"
linode_web_instance_node_count = 0

linode_db_instance_group      = "dbserver"
linode_db_instance_image      = "linode/ubuntu20.04"
linode_db_instance_node_count = 0
