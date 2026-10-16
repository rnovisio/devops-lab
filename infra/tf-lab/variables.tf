variable "rg_name" {
  type    = string
  default = "rg-lab-terraform"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "tags" {
  type = map(string)
  default = {
    env   = "lab"
    owner = "ryan"
  }
}
