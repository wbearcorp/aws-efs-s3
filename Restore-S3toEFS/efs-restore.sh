#!/bin/bash
# Input arguments
destinationEFS=$1
sourceS3=$2

# Prepare system for rsync
echo 'update aws cli'
sudo pip install awscli
echo 'sudo yum -y install nfs-utils'
sudo yum -y install nfs-utils
echo 'sudo mkdir /restore'
sudo mkdir /restore
echo "sudo mount -t nfs $source /backup"
sudo mount -t nfs $destinationEFS /restore
echo "aws s3 sync s3://my-bucket/path . --delete"
cd /restore
sudo aws s3 sync $sourceS3 . --delete
syncStatus=$?
exit $syncStatus