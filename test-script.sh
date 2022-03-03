#!/bin/bash

touch /home/ubuntu/testfilemyfile
echo "stuff..." >> /home/ubuntu/testfilemyfile

sudo apt-get update
sudo apt-get install -y jq
