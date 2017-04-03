# terraform-iot-aliyun
Example terraform for an IoT project in Aliyun cloud

## Description
The example launches an example IoT project such as a VPC, VSwitch, NAT gateway, ECS, SecurityGroups. You may want to explore the "minimal" terraform first, and then try the full project in "main"

### Minimal 

cd minimal
terraform plan
terraform apply
terraform destroy -force

### Get up and running

The cluster is controlled from the "main" folder:
cd main

* Initialize phase
		terraform init

* Get phase
		terraform get

* Planning phase

		terraform plan 
    		
* Apply phase

		terraform apply 
		   
* Destroy (Dangerous! Will destroy everything it knows about) 

		terraform destroy

* Forget Everything (Dangerous! Will forget everything it knows)
		rm -rf .terraform
		rm terraform.tfstate*

