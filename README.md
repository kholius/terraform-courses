# This project
This project is present to create a scaled infrastructure;

based on a AMI which contains HTTPd (non crontab);
an autoscaling group, an ALB and security group for each

# To run 

```
terraform init
terraform plan -out aws-infra
terraform apply aws-infra

```


