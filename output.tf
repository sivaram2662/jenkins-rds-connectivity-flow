output "jenkinspublicip" {
  value = aws_instance.cicd.public_ip
}

output "cicd-private-ip" {
  value = aws_instance.cicd.private_ip

}

