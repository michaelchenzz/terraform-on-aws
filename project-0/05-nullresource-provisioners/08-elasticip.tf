resource "aws_eip" "bastion_eip" {
  depends_on = [module.vpc]
  instance   = module.ec2_bastion.id
  domain     = "vpc"

  # Local Exec Provisioner: Destroy-time Provisioner (need to put inside a resource block)
  provisioner "local-exec" {
    command = "echo Destroy time prov ${formatdate("EEEE, DD MMM YYYY hh:mm:ss ZZZ", timestamp())} >> destroy-time-provisioner.txt"
    when    = destroy
  }
}

output "bastion_eip" {
  value = aws_eip.bastion_eip.public_ip
}
