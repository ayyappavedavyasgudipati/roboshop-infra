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

resource "terraform_data" "bootstrap_mongodb" {
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
        "sudo sh /tmp/bootstrap.sh mongodb"
    ]
  }
}



resource "aws_instance" "redis" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.redis_sg_id]
  tags = merge(
    local.ec2_tags,
    {
      Name = "${var.project}-${var.environment}-redis"
    }
  )
}

resource "terraform_data" "bootstrap_redis" {
  triggers_replace = [
    aws_instance.redis.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.redis.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh redis"
    ]
  }
}



resource "aws_instance" "rabbitmq" {
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  tags = merge(
    local.ec2_tags,
    {
      Name = "${var.project}-${var.environment}-rabbitmq"
    }
  )
}

resource "terraform_data" "bootstrap_rabbitmq" {
  triggers_replace = [
    aws_instance.rabbitmq.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.rabbitmq.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh rabbitmq"
    ]
  }
}