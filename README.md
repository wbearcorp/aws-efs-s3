# aws-efs-s3

This project contain 2 scripts with 2 pipelines.

Backup EFS S3 => Create a pipeline to launch an instance in your VPC who can connect to your EFS and made a copy in a S3 bucket (with versionning to keep old files)

Restore S3 EFS => Create a pipeline to launch an instance in your VPC who can connect to your EFS and copy all data from a S3 bucket on it
