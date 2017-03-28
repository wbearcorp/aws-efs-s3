#!/bin/bash
# Input arguments
source=$1
destinationS3=$2

# Prepare system for rsync
echo 'update aws cli'
sudo pip install awscli
echo 'sudo yum -y install nfs-utils'
sudo yum -y install nfs-utils
echo 'sudo mkdir /backup'
sudo mkdir /backup
echo "sudo mount -t nfs $source /backup"
sudo mount -t nfs $source /backup
echo "aws s3 sync . s3://my-bucket/path --delete"
cd /backup
sudo aws s3 sync . $destinationS3 --delete
syncStatus=$?
exit $syncStatus