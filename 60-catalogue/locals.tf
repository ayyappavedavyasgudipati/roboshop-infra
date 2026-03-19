locals {
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backende_alb_listner_arn = data.aws_ssm_parameter.backende_alb_listner_arn.value
}