resource "aws_instance" "mongodb" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.mongodb_sg_id]
  tags = merge(
    local.ec2_tags,
    {
      Name = "${var.project}-${var.environment}-bastion"
    }
  )
}