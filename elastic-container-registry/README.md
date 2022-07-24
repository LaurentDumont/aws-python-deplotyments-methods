### Terraform code to deploy an Elastic Container Registry

#### ECS Settings
- Private container registry.
- Images are scanned when pushed to the registry.
- ECR has an implicit relation ship of one-to-one with repositories and images.
- You will need one repository per image you are trying to push. There is no such thing as a namespace/folder where multiple images can co-exist.

#### Deployment instructions

```
terraform init
terraform apply
```

#### Permissions overview

By default, the user creating the ECR repository will have full access to push and pull images.

#### Pushing images with docker
This will auto-configure the docker config file in `~/.docker/config.json`

Replace the `$VARIABLE_NAME_HERE` with the appropriate values.

```
# Get the ECR credentials configured into Docker
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_REGISTRY_URI

# Tag your image
docker tag gremlins-api $AWS_REGISTRY_URI/gremlins-api:prod

# Push your image
docker push $AWS_REGISTRY_URI/gremlins-api:prod
```

#### Pulling images

You will need to be logged into the ECR Registry.

```
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_REGISTRY_URI
```

You can then pull the image

```
docker pull $AWS_REGISTRY_URI
```

