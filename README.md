# Managed database infrastructure

Terraform for the private PostgreSQL RDS instance used by the mechanic-shop application. It intentionally contains no Kubernetes, Lambda, API Gateway, or application resources.

Deploy the Kubernetes infrastructure first. Copy its `database_vpc_id`, `database_vpc_cidr`, and `private_subnet_ids` outputs into this repository's GitHub environment variables (`VPC_ID`, `VPC_CIDR`, `PRIVATE_SUBNET_IDS_JSON`). Store `DATABASE_PASSWORD` and `AWS_ROLE_TO_ASSUME` as environment secrets.

The workflow validates every pull request and runs `plan` then `apply` only after a push to `main` or `master`. Configure the pre-existing remote-state S3 bucket and lock table as `TF_STATE_BUCKET` and `TF_LOCK_TABLE` repository variables. It is not executed by local development commands.
