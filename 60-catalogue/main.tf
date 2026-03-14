resource "aws_instance" "catalogue" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  subnet_id = local.private_subnet_ids
  vpc_security_group_ids = [local.catalogue_sg_id]
  tags = merge(
    var.ec2_tags,
    {
      Name = "${var.project}-${var.environment}-catalogue"
    }
  )
}

resource "terraform_data" "bootstrap_catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh catalogue"
    ]
  }
}