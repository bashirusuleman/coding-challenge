variable "project_id"{
        type = string
}
variable "region"{
    type = string
}

variable "number"{
    type = number  #This number will be provided to get the number of subnets in a region
    description = "A dynamic Number >=0 but less than number of AZs in a region"
}

variable "credentials"{
    type = string
    description = "Service account credentials for Authentication"
}

variable "network_vpc"{
    default = "coding-challenge"
    type = string
    description = "VPC Name"
}

variable "location"{
    type = string
    default = "US"
}

variable "nat_router" {
    type = string
    default = "coding-challenge-nat"
}
variable "router" {
  default = "challenge-router"
  type = string
}

variable "ports" {
    default = ["22", "80", "3389"]
    type = list(string) 
    description = "List of Ports to be confgiured in the firewall rule"
}