provider "aws" {
  region = "us-east-1"
}

# Criação de um bucket S3
resource "aws_s3_bucket" "example_bucket" {
  bucket = "meu-bucket-teste-nist"
  acl    = "private"  # Definindo como privado, uma boa prática de segurança

  tags = {
    Name        = "MeuBucketNIST"
    Environment = "Dev"
  }
}

# Adicionando versão para o bucket (para boas práticas de compliance)
resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
###
