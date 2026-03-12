resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 1
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 1
  records = [aws_instance.redis.private_ip]
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 1
  records = [aws_instance.rabbitmq.private_ip]
}