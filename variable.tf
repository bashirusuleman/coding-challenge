variable "project"{
    default = "code-challenge"
    type = string
}
variable "region"{
    type = string
}

variable "number"{
    type = number
    description = "A dynamic Number between 0 & 3"
}