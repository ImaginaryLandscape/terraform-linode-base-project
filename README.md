# terraform-linode-base-project

terraform-linode-infra

- [terraform-linode-base-project](#terraform-linode-base-project)
  - [Getting started](#getting-started)
  - [Base project and modules development](#base-project-and-modules-development)
  - [Building infrastructure - Tier example settings](#building-infrastructure---tier-example-settings)
    - [Tier 1 - 1 LB / 2-4 WEB / 1 DB](#tier-1---1-lb--2-4-web--1-db)
    - [Tier 2 - 1 LB / 1   WEB / 1 DB](#tier-2---1-lb--1---web--1-db)
    - [Tier 3 - 1 LB / 1   WEB/DB](#tier-3---1-lb--1---webdb)

## Getting started

- Copy/Paste that file `tf-envs/example/secrets.example..tfvars` into a new `tf-envs/new-env/secrets.tfvars` file and update the vars. All possible variables are located in the `varaibles.tf` file.

    ```tfvars
    LN_API_TOKEN    = ""
    LN_REGION       = ""

    AWS_ACCESS_KEY  = ""
    AWS_SECRET_KEY  = ""
    AWS_REGION      = ""

    authorized_keys = ["~/.ssh/id_ed25519.pub"]
    public_key_path = "~/.ssh/id_ed25519.pub"

    linode_web_instance_type        = "g6-nanode-1"
    linode_web_instance_node_count  = 2

    linode_db_instance_type         = "g6-nanode-1"
    linode_db_instance_node_count   = 1

    SITE    = "example"             # would label servers:
    ID      = "1"                   # example-db1.dev.example.com
    DOMAIN  = "dev.example.com"     # example-web1.dev.example.com
    ```

- Copy/Paste the `backends.example.tfvars` file into a new one, and fill in the parameters.

- The values in the `terraform.tfvars` should be fine, as they are general, but can be overridden using a `override.tfvars` file.

- Initialize terraform dependencies and backend: `make dev-init`

- Plan and apply changes: `make dev-plan` and apply changes

- List of the main `make` commands per env in the `Makefile`:

| *Cmd/Env*             | **sandbox**          | **dev**          | **staging**          | **prod**          |
| --------------------- | -------------------- | ---------------- | -------------------- | ----------------- |
| **terraform init**    | make sandbox-init    | make dev-init    | make staging-init    | make prod-init    |
| **terraform plan**    | make sandbox-plan    | make dev-plan    | make staging-plan    | make prod-plan    |
| **terraform apply**   | make sandbox-apply   | make dev-apply   | make staging-apply   | make prod-apply   |
| **terraform refresh** | make sandbox-refresh | make dev-refresh | make staging-refresh | make prod-refresh |
| **terraform destroy** | make sandbox-destroy | make dev-destroy | make staging-destroy | make prod-destroy |

## Base project and modules development

- To make the dev of the base project and the modules easier run this command `./scripts/modules_symlinks.sh` this will update the  `~/workspace/terraform-linode-base-project` like below:

    ```console
    ../terraform-linode-module-dbserver         # .git
    ../terraform-linode-module-network          # .git
    ../terraform-linode-module-nodebalancer     # .git
    ../terraform-linode-module-webserver        # .git
    ../terraform-linode-base-project            # .git
    ├── modules
    │   ├── terraform-linode-module-dbserver -> ../terraform-linode-module-dbserver
    │   ├── terraform-linode-module-network -> ../terraform-linode-module-network
    │   ├── terraform-linode-module-nodebalancer -> ../terraform-linode-module-nodebalancer
    │   └── terraform-linode-module-webserver -> ../terraform-linode-module-webserver
    ├── scripts
    └── tf-envs                         # all the differente envs
        ├── dev                         
            ├── backends.tfvars
            └── secrets.tfvars
        ├── prod
            ├── backends.tfvars
            └── secrets.tfvars
        ├── sandbox
            ├── backends.tfvars
            └── secrets.tfvars
        └── staging
            ├── backends.tfvars
            └── secrets.tfvars
    ```

    NB:
      - The `module` dir is only to help for the development part of those modules.
      - The `tf-envs` dir contains the secrets variables separated by env. Those are not versioned.

- Then update the `dev/maint.tf` modules sources:

    ```hcl
    module "webserver" {
        source = "../modules/terraform-linode-module-dbserver"
        ..
    }
    
    module "webserver" {
        source = "../modules/terraform-linode-module-network"
        ..
    }
    
    module "webserver" {
        source = "../modules/terraform-linode-module-nodebalancer"
        ..
    }
    
    module "webserver" {
        source = "../modules/terraform-linode-module-webserver"
        ..
    }
    
    ```

- Initialize terraform dependencies

  - to use a ***remote*** backend ***(preferred for prod / staging / dev env)*** run this: `terraform init -backend-config=backends.example.tfvars`
  - to use a ***local*** backend ***(preferred for sandbox env)*** run this: `make terraform-init`

- `make terraform-plan` and apply changes

## Building infrastructure - Tier example settings

### Tier 1 - 1 LB / 2-4 WEB / 1 DB

- `secret.tfvars`:

    ```tfvars
    linode_web_instance_type        = "g6-nanode-1"
    linode_web_instance_node_count  = 2
    linode_db_instance_type         = "g6-nanode-1"
    linode_db_instance_node_count   = 1
    SITE                            = "example"
    ID                              = "1"
    ```

### Tier 2 - 1 LB / 1   WEB / 1 DB

- `secret.tfvars`:

    ```tfvars
    linode_web_instance_type        = "g6-nanode-1"
    linode_web_instance_node_count  = 1
    linode_db_instance_type         = "g6-nanode-1"
    linode_db_instance_node_count   = 1
    SITE                            = "example"
    ID                              = "1"
    ```

### Tier 3 - 1 LB / 1   WEB/DB

- `secret.tfvars`:

    ```tfvars
    linode_web_instance_type        = "g6-nanode-1"
    linode_web_instance_node_count  = 1
    linode_db_instance_type         = "g6-nanode-1"
    linode_db_instance_node_count   = 0
    SITE                            = "example"
    ID                              = "1"
    ```
