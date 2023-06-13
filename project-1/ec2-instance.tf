resource "aws_instance" "ec2-bastion" {
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #user_data     = file("${path.module}/app1.sh")

  vpc_security_group_ids = [aws_security_group.sg-ssh.id, aws_security_group.sg-web.id]

  count = var.number_of_instances

  tags = {
    Name = "${var.project}-${var.env}-ec2-${count.index}"
  }
}
