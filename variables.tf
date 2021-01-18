variable "vpc_cidr"{
    default = "192.168.0.0"
}

variable "project"{
    default = "project"
}

variable "region"{
    default="ap-south-1"
}

variable "az"{
    default=["a","b"]
}

variable "public"{
    default = ["192.168.1.0","192.168.3.0"]
}

variable "private"{
    default = ["192.168.2.0","192.168.4.0"]
}