resource "aws_instance" "example" {
  ami            ="ami-0dee22c13ea7a9a67"
#  instance_type = "t3.micro"
  instance_type =  var.environment == "dev" ? "t2.micro" : "t3.micro"
  tags =  var.tags
}


resource "aws_security_group" "ingress_rule" {
  name="sg"
  dynamic "ingress"  {

    for_each = var.ingress_rules
    content {

    
    from_port       = ingress.value.from_port
    to_port         = ingress.value.to_port
    protocol        = ingress.value.protocol
    cidr_blocks     = ingress.value.cidr_blocks
    }


    }
  egress = []
}


locals {
  all_instances_ids = aws_instance.example[*].id
}
