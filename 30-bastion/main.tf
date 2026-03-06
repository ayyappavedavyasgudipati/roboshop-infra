resource "aws_instance" "bastion" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  subnet_id = local.public_subnet_ids
  vpc_security_group_ids = [local.bastion_sg_id]
  tags = merge(
    local.ec2_tags,
    {
      Name = "${var.project}-${var.environment}-bastion"
    }
  )
}