#!/bin/bash

VAULT_NAME=$1

touch /home/ubuntu/testfilemyfile
echo "stuff..." >> /home/ubuntu/testfilemyfile

sudo apt-get update
sudo apt-get install -y jq

echo "my vault name: ${VAULT_NAME}" >> /home/ubuntu/testfilemyfile
