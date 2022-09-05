variable "region_name" {
    description = "name of region"
    default = "eu-west-2"
    type = string
}


variable "cidr_for_vpc" {
    description = "making cidr for vpc a variable"
    default = "100.0.0.0/18"
    type = string
}

variable "cidr_for_Public_subnet1" {
    description = "making cidr for public subnet1 a variable"
    default = "100.0.1.0/24"
    type = string
}

variable "cidr_for_Public_subnet2" {
    description = "making cidr for public subnet2 a variable"
    default = "100.0.2.0/24"
    type = string
}

variable "cidr_for_Private_subnet1" {
    description = "making cidr for public subnet1 a variable"
    default = "100.0.3.0/24"
    type = string
}

variable "cidr_for_Private_subnet2" {
    description = "making cidr for public subnet2 a variable"
    default = "100.0.4.0/24"
    type = string
}
