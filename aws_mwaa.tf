
module "aws_mwaa" {
  source   = "./modules/aws_mwaa"

  security_group_id = "sg-0d58ebc9d4cd5f70b"
  subnets = ["subnet-0916e89a5cc57ca03", "subnet-0a81f8e153d465b26"]
}