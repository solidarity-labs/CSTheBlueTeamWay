resource "aws_instance" "ubuntu-vpn-server" {
  ami                         = "ami-0af6e9042ea5a4e3e"
  instance_type               = "t2.small"
  key_name                    = aws_key_pair..key_name
  subnet_id                   = aws_subnet..id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.public_ssh_to_vpn.id]
  disable_api_termination = true
}