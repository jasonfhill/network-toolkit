locals {
  name = "${var.name}-${terraform.workspace}"

  tags = merge(
    var.tags,
    {
      Environment = terraform.workspace
    },
  )
}