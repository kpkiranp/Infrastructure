#Displaying the public ip of the jenkins server to access the jenkins UI

output "jenkins_instance_public_ip"{
    value = module.create_ec2_instance.ec2_public_ip_address
}