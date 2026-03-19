resource "aws_ssm_parameter" "backende_alb_listner_arn" {
    name = "/${var.project}/${var.environment}/backende_alb_listner_arn"
    type  = "String"
    value = aws_lb_listener.http.arn
}