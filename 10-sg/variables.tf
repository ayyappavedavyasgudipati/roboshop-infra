variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = list
    default = ["mongodb" , "redis" , "rabbitmq" , "mysql" , "catalogue" , "cart" , "user" , "shipping" , "payment" , "frontend" , "bastion" 
    , "frontend_alb" , "backend_alb"]
}