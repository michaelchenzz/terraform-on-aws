resource "null_resource" "name" {
  depends_on = [module.ec2_bastion]
  # Connection Block for Provisioners to connect to EC2 instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    private_key = file("dattt.pem")
  }

  # File Provisioner: Copy the dattt.pem file to /tmp/dattt.pem
  provisioner "file" {
    source      = "dattt.pem"
    destination = "/tmp/dattt.pem"
  }

  # Remote Exec Provisioner: To fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/dattt.pem"
    ]
  }

  # Local Exec Provisioner: Create-time Provisioner
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    #on_failure = continue
  }

  # Local Exec Provisioner: Destroy-time Provisioner
  # provisioner "local-exec" {
  #   command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
  #   when    = destroy
  #   #on_failure = continue
  # }
}
