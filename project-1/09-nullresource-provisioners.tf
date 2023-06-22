resource "null_resource" "name" {
  # Connection Block for Provisioners to connect to EC2 instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
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

  # Local Exec Provisioner: 
  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }

  provisioner "local-exec" {
    command     = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when        = destroy
    #on_failure = continue
  }
}
