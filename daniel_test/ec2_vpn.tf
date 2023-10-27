resource "aws_instance" "ubuntu-daniel-server" {
  ami                         = "ami-0af6e9042ea5a4e3e"
  instance_type               = "t2.small"
  key_name                    = aws_key_pair.santi-key.key_name
  subnet_id                   = "subnet-04cdf8956d97d2f1b"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-06d84080086d6da69"]
  disable_api_termination = true
}
