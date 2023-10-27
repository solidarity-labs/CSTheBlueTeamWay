resource "aws_key_pair" "vpn-{group}-key" {
  key_name   = "bastion-key"
  public_key = "ssh-rsa sarasrasasdasdas"
}



