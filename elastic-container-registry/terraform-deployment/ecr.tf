resource "aws_ecr_repository" "ecr_repository" {
  name                 = "gremlins-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
