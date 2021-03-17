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
    description = "VPC Network Name"
}


variable "website"{
    type = string
    default = "code-challenge.com"
}

variable "location"{
    type = string
    default = "US"
}
