######################
#provider vars
######################



###########################
#data vars
###########################

### vault
variable vault_addr {
  type = string
  description = "HCP vault address"
  sensitive = false
  #default = ""
}

variable "vault_token" {
  type = string
  description = "vault access token"
  sensitive = true
  
}



######################################
# ressources vars
######################################

