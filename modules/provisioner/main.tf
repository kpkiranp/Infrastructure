# Defining the null resource for remote exec which has a connection block to connect to jenkins server and perform remote exec

resource "null_resource" "install_jenkins_remote_exec" {
    connection {
      type = "ssh"
      host = var.host
      user = var.user
      private_key = file(var.ec2_pem)
      agent = false
    }

    # provisioner "file" {
    #     source      = var.src
    #     destination = var.dest
    # }

      provisioner "remote-exec" {
      script = var.src
    }
}