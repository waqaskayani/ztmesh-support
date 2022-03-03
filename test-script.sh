#!/bin/bash

INSTANCE_NAME=$1
VAULT_NAME=$2
BUILD_ENV=$3
PATH=/root/.relay-agent

apt-get update
apt-get install -y jq

touch /home/ubuntu/newfile
echo "stuff..." >> /home/ubuntu/newfile

echo "my instance name: ${INSTANCE_NAME}" >> /home/ubuntu/newfile
echo "my vault name: ${VAULT_NAME}" >> /home/ubuntu/newfile
echo "my build name: ${BUILD_ENV}" >> /home/ubuntu/newfile

mkdir /opt/music
mkdir -p /home/ubuntu/newdir
