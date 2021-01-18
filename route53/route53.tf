resource "aws_route53_zone" "public" {
  name = "freakinguy.co.uk"
}

resource "aws_route53_record" "ns" {
  allow_overwrite = true
  name            = "freakinguy.co.uk"
  ttl             = 30
  type            = "NS"
  zone_id         = aws_route53_zone.public.zone_id

  records = [
    aws_route53_zone.public.name_servers[0],
    aws_route53_zone.public.name_servers[1],
    aws_route53_zone.public.name_servers[2],
    aws_route53_zone.public.name_servers[3],
  ]
}