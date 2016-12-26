resource "aws_route53_record" "route-53-public" {
  zone_id = "${var.zone_id_public}"
  name    = "${var.instance_name}-${format("%03d",count.index)}-${var.env}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${element(aws_instance.vpn.*.public_dns, count.index)}"]
}

resource "aws_route53_record" "route-53-private" {
  zone_id = "${var.zone_id_private}"
  name    = "${var.instance_name}-${format("%03d",count.index)}-${var.env}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${element(aws_instance.vpn.*.private_dns, count.index)}"]
}
