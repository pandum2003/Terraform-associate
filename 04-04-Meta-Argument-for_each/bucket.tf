
# Create S3 Bucket per environment with for_each and maps
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "demobuckt" {
    #for each meta argument
    for_each = {
      "dev" = "devapp-bucket" 
      "qa"  = "qaapp-bucket"
      "stage"= "stageapp-bucket"
      "prod" = "prodapp-bucket"
    }

    bucket = "${each.key}-${each.value}"
    tags = {
        environment = each.key
        bucketname  = "${each.key}-${each.value}"
        eachvalue = each.value
    }
}



