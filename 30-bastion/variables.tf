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
        Terraform = "true"
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