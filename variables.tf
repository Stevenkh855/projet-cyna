
# Région où seront déployées les ressources
variable "location" {
  default = "France Central"
}

# Nom du groupe de ressources utilisé
variable "resource_group_name" {
  default = "rg-cyna"
}

# Variable qui permet de transmettre l'ID du sous-réseau backend (c'est facultatif si on référence directement)
variable "backend_subnet_id" {
  description = "ID du subnet backend"
  type        = string
}
