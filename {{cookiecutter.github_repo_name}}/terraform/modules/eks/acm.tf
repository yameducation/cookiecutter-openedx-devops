module "acm_subdomains" {
  source  = "terraform-aws-modules/acm/aws"
  version = "{{ cookiecutter.terraform_aws_modules_acm }}"

  providers = {
    aws = aws.us-east-1
  }

  count       = length(var.subdomains)
  domain_name = aws_route53_zone.subdomain[count.index].name
  zone_id     = aws_route53_zone.subdomain[count.index].id

  subject_alternative_names = [
    "*.${aws_route53_zone.subdomain[count.index].name}",
  ]

  wait_for_validation = true
  tags                = var.tags
}
