variable "ami" {
    type = map 
    default = {
        "ap-south-1" = "308wr09wr99r"
        "us-east-1" = "w38w930r89wr"
    }
  
}

variable "region" {
    validation {
      condition = contains(["ap-south-1, us-east-1"], var.region)
      error_message = "this is not going to support"
    }
  
}





resource "aws_instance" "webserver" {
    instance_type = "t2.micro"
    #ami = var.ami[var.region]
    #ami = lookup(var.ami,var.region,"ami-default")
    ami = try(var.ami[var.region],"ami-default")
  
}