#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker 
sudo usermod -aG docker ec2-user
docker pull jenkins/jenkins
docker volume create jenkins_volume
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_volume:/var/jenkins_home --name jenkins_container jenkins/jenkins
