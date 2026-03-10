resource "aws_instance" "mongodb" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.mongodb_sg_id]
  tags = merge(
    local.ec2_tags,
    {
      Name = "${var.project}-${var.environment}-mongodb"
    }
  )
}

resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb"]
  }
}