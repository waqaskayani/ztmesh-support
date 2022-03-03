#!/bin/bash

INSTANCE_NAME=$1
VAULT_NAME=$2
BUILD_ENV=$3
PATH=/root/.relay-agent

sudo apt-get update
sudo apt-get install -y jq

touch /home/ubuntu/instance
echo "my instance name: ${INSTANCE_NAME}" > /home/ubuntu/instance
touch /home/ubuntu/vault
echo "my vault name: ${VAULT_NAME}" > /home/ubuntu/vault
touch /home/ubuntu/build
echo "my build name: ${BUILD_ENV}" > /home/ubuntu/build
mkdir /home/ubuntu/testdir
mkdir /root/.testdir
