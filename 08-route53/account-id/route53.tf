# AWS Route53 Zone 
resource "aws_route53_zone" "accountdevops_com" {
  name = "accountdevops.com"
}

# MX Record for G. Suite
resource "aws_route53_record" "accountdevops_com_mx" {
  zone_id = aws_route53_zone.accountdevops_com.zone_id
  name    = "accountdevops.com"
  type    = "MX"
  ttl     = "3600"
  records = [
    "1 ASPMX.L.GOOGLE.COM.",
    "5 ALT1.ASPMX.L.GOOGLE.COM.",
    "5 ALT2.ASPMX.L.GOOGLE.COM.",
    "10 ALT3.ASPMX.L.GOOGLE.COM.",
    "10 ALT4.ASPMX.L.GOOGLE.COM."
  ]
}


# CNAME Record Example
resource "aws_route53_record" "app_accountdevops_com" {
  zone_id = aws_route53_zone.accountdevops_com.zone_id
  name    = "app.accountdevops.com."
  type    = "CNAME"
  ttl     = "300"
  records = ["www.accountdevops.com"]
}

resource "aws_route53_record" "test_accountdevops_com" {
  zone_id = aws_route53_zone.accountdevops_com.zone_id
  name    = "test.accountdevops.com."
  type    = "CNAME"
  ttl     = "300"
  records = ["www.accountdevops.com"]
}
