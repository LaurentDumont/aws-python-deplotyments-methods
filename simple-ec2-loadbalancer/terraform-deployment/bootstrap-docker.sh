#! /bin/bash
sudo yum update
sudo yum upgrade -y
sudo yum install git -y
sudo amazon-linux-extras install docker -y
sudo service docker enable
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
sudo aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 222604458319.dkr.ecr.ca-central-1.amazonaws.com
docker run -d -p 80:80 222604458319.dkr.ecr.ca-central-1.amazonaws.com/gremlins-api