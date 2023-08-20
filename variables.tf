######################
#provider vars
######################



###########################
#data vars
###########################

### vault
variable vault_addr {
  type = string
  description = "Adresse des Vaults"
  sensitive = false
  default = "https://10.28.5.100:8200"
}

variable "vault_token" {
  type = string
  description = "vault access token"
  sensitive = true
  
}



######################################
# ressources vars
######################################

