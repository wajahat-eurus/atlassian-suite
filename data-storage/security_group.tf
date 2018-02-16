# Get rid of inline blocks
resource "aws_security_group" "db" {
  name        = "${var.name_tag}_sg"
  description = "Allow access to ${var.name_tag} DB from application servers"
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.name_tag}"
  }

  ingress {
    from_port       = "${var.open_port_range[0]}"
    protocol        = "tcp"
    to_port         = "${var.open_port_range[1]}"
    security_groups = ["${var.allowed_sgs}"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
