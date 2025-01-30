terraform {
  backend "s3" {
    bucket         = "mind-blowing-bucket"  
    key    = "terraform.tfstate"
    region         = "ap-south-1"                                                         
  }
}
