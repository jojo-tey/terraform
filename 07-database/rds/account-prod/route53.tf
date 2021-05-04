# Route53 Record for Primary DB endpoint
resource "aws_route53_record" "account_db" {
  zone_id = data.terraform_remote_state.vpc.outputs.route53_internal_zone_id
  name    = "account-db.${data.terraform_remote_state.vpc.outputs.route53_internal_domain}"
  type    = "CNAME"
  ttl     = 60
  records = [var.account_aurora_endpoint]
}


# Route53 Record for Replica DB endpoint
resource "aws_route53_record" "account_db_replica" {
  zone_id = data.terraform_remote_state.vpc.outputs.route53_internal_zone_id
  name    = "account-db-replica.${data.terraform_remote_state.vpc.outputs.route53_internal_domain}"
  type    = "CNAME"
  ttl     = 60
  records = [var.account_aurora_reader_endpoint]
}
