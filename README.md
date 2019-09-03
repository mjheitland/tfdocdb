This Terraform project shows how to specify and deploy the following components:
+ 1 VPC
+ 1 internet gateway
+ 1 public subnet for our bastion server
+ 3 private subnets for our docdb cluster (3 is the minimum that docdb accepts!)
+ 1 public route table (opening the ingress ports listed in terraform.tfvars)
+ 1 public route table association
+ 1 private default route table (will automatically be associated with all unattached subnets)
+ 1 security group for our bastion server (port 22)
+ 1 security group for our document db instances (port 27017)

+ 1 keypair (first you have to run ssh-keygen in your home folder)
+ 1 ec2 micro instance for our bastion server

+ 1 docdb subnet group including the three private subnets 
+ 1 docdb cluster using the docdb subnet group
+ 3 docdb nodes (ec2 instances of type db.r5.large)

## in .zshrc

    export AWS_ACCESS_KEY_ID="xxx"
    export AWS_SECRET_ACCESS_KEY="xxx"
    export AWS_DEFAULT_REGION="eu-central-1"

## generate a keypair to access EC2 instances

    ssh-keygen

## Terraform commands
    
    terraform init
    
    terraform validate
    
    terraform plan -out=tfplan
    
    terraform apply -auto-approve tfplan
    
    terraform apply -auto-approve
    
    terraform destroy -auto-approve

## To delete Terraform state files
    rm -rfv **/.terraform # remove all recursive subdirectories
    
## To test DocumentDB
1.  `cd /tmp`
2.  copy from console "documentdb" tab:

        mongo 
          --ssl 
          --host <docdb cluster endpoint>
          --sslCAFile rds-combined-ca-bundle.pem
          --username <yourMasterUsername>
          --password <yourMasterPassword>
3.  `db.col.insert({hello:”Amazon DocumentDB”})`
4.  `db.col.find()`
