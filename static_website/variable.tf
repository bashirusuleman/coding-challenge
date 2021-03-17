variable "project_id"{
        type = string
}
variable "region"{
    type = string
}


variable "credentials"{
    type = string
    description = "Service account credentials for Authentication"
}

variable "website"{
    type = string
    default = "code-challenge-bashiru"
}

variable "location"{
    type = string
    default = "US"
}


