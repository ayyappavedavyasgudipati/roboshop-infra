locals {
    ec2_tags = var.ec2_tags
    public_subnet_ids = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}