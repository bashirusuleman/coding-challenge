# This Repo contains codes for:
- VPC Deployment in GCP
- Python script to automate the creation of directories and copying of files to destination directories based on the names of the files in the source directory.

# For GCP deployment using terraform:

## To apply, create terraform.tfvars file with custom values for the variables below, then run:<br>

> ## __terraform init__ <br>
> ## __terraform plan__ <br>
> ## __terraform apply__ <br>

### region = REGION
### credentials = "./PATH_TO_SERVICEACCOUNT_CREDENTIALS.json"
### project_id = "GCP_PORJECT_ID"
### number = NUMBER_GREATER_THAN_OR_EQUAL_TO_0_BUT_LESS_THAN_NUMBER_OF_AZs_IN_A_REGION
