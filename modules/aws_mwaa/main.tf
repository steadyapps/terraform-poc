data "aws_security_group" "security_group" {
  id = var.security_group_id
}

data "aws_s3_bucket" "bucket" {
  bucket = "airflow-steady-dev"
}


data "aws_iam_role" "airflow_role" {
    name = "steady-airflow-dev-execution-role"

  }


resource "aws_mwaa_environment" "airflow" {
  dag_s3_path        = "dags/"
  execution_role_arn = data.aws_iam_role.airflow_role.arn
  name               = "airflow-steady-dev-latest"

  network_configuration {
    security_group_ids = data.aws_security_group.security_group.id
    subnet_ids         = var.subnets
  }

  source_bucket_arn = data.aws_s3_bucket.bucket.arn

      tags = {
        Environment = "dev"
      }
}