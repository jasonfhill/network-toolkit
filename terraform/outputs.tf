output "ami" {
  sensitive = true
  value = {
    github_aws_user_id: aws_iam_access_key.github.id
    github_aws_user_secret: aws_iam_access_key.github.secret
  }
}