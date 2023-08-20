terraform {
  required_version = ">= 1.3.3"
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = ">= 0.11.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">=2.2.3"
    }

    vault = {
      source = "hashicorp/vault"
      version = ">=3.11.0" 
    }

  }
}



##################################################################################
# PROVIDERS
##################################################################################


provider "vault" {
  address = "${var.vault_addr}"
  token = "${var.vault_token}"
  skip_child_token = true
}

provider "ct" {}


##################################################################################
# DATA
##################################################################################
#  data "vault_generic_secret" "vault_secret_AD"{
#   path = "deployment/AD"
# }

data "ct_config" "config" {
  #content = file("./config.yaml")
  content = file("${path.module}/config.yaml")
  strict  = true
}


##################################################################################
# RESOURCES
##################################################################################


# Render as Ignition
resource "local_file" "fedora-coreos" {
  content  = data.ct_config.config.rendered
  filename = "${path.module}/output/fedora-coreos.ign"
}
