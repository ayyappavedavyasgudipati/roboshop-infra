variable "ec2" {
    type = object({
        ami = string
        instance_type = string
    })

    default = {
        ami = "ami-0220d79f3f480ecf5"
        instance_type = "t3.micro"
    }
}

variable "ec2_tags" {
    type = map(string)

    default = {
        
    }
}

variable "project" {
    type = string
    default = "roboshop"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "vol_tags" {
    type = map(string)

    default = {
        
    }
}

variable "domain_name" {
    default= "opswithvyas.online"
}

variable "zone_id" {
    default = "Z10201011EZM611L941TT"
}