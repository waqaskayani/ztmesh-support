#!/bin/bash

INSTANCE_NAME=$1
VAULT_NAME=$2
BUILD_ENV=$3
PATH=/root/.relay-agent

touch /home/ubuntu/testfilemyfile
echo "stuff..." >> /home/ubuntu/testfilemyfile

sudo apt-get update
sudo apt-get install -y jq

echo "my vault name: ${VAULT_NAME}" >> /home/ubuntu/testfilemyfile
