module "component" {
    for_each = var.components
    source = source = "git::https://github.com/ayyappavedavyasgudipati/terraform-roboshop-components.git"
    component    = each.key
    rule_priority = each.value.rule_priority
}