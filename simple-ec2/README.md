### Simple EC2 deployment

- Create an EC2 instance
- Assign a custom instance-profile to be able to pull images from ECR
- Use a bootstrap script to :
  - Install docker
  - Pull the gremlins-api image and start a docker container