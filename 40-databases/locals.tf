locals {
    ec2_tags = var.ec2_tags
    database_subnet_ids = split(",",data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}