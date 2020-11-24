
resource "aws_instance" "consul_server" {

  ami           = lookup(var.ami, var.region)
  instance_type = var.instance_type
  key_name      = var.key_name
  count = var.num_of_servers

  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]

  tags = {
    Name = "consul-server${count.index}"
    consul_server = "true"
  }

}

resource "aws_instance" "consul_agent" {

  ami           = lookup(var.ami, var.region)
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]

  tags = {
    Name = "consul-agent"
  }
}

output "server" {
  value = aws_instance.consul_server[*].public_dns
}

output "agent" {
  value = aws_instance.consul_agent.public_dns
}
