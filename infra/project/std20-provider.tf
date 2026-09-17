# =============================================================================
# Terraform / Provider / Backend
# =============================================================================

terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

    backend "s3" {
      bucket              = "std20-cicd-terraform-state-bucket"         # 테라폼 상태파일을 저장할 버킷 이름
      key                 = "ex7-pub-state/terraform.tfstate"           # 버킷에서 테라폼 상태파일 저장 경로
      region              = "ap-east-1"
      dynamodb_table      = "std20-cicd-terraform-state-lock"           # 락온 상태를 저장할 DynamoDB 테이블
      encrypt             = true                                        # 파일 암호화
      use_lockfile        = true
    }
}

provider "aws" {
  region = "ap-east-1"

  default_tags {
    tags = {
      Owner = "std20"
      Class = "bipa17"
    }
  }
}
