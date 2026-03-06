module "vpc" {
    source = "../../terraform-vpc-module"
    project = var.project
    environment = var.environment
}