terraform {

  backend "s3" {
    bucket         = "devops-terraform-state-367397889368"
    key            = "rowden/exam/state.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "devops-terraform-lock-table-367397889368"
  }

}