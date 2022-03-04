#!/bin/bash

INSTANCE_NAME=$1
VAULT_NAME=$2
BUILD_ENV=$3
FILEPATH=/root/.relay-agent

apt update -y
apt install jq -y

# Get access token for Azure Vault audience
access_token=$(curl -s 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://vault.azure.net' -H Metadata:true | jq -r '.access_token')

mkdir -p $FILEPATH
cat >$FILEPATH/config.json << 'EOL'
{
  "login_config": {
    "access_key_id": "value_1",
    "secret_access_key": "value_2"
  },
  "site_config": {
    "id": "value_3",
    "name": "value_4"
  }
}
EOL
cat >$FILEPATH/instance_name << 'EOL'
instance_name
EOL

sed -i "s~instance_name~${INSTANCE_NAME}~g" $FILEPATH/instance_name

sed -i "s~value_1~$(curl -s "https://${VAULT_NAME}.vault.azure.net/secrets/access-key-id?api-version=2016-10-01" -H "Authorization: Bearer $access_token" | jq -r '.value')~g" $FILEPATH/config.json
sed -i "s~value_2~$(curl -s "https://${VAULT_NAME}.vault.azure.net/secrets/secret-access-key?api-version=2016-10-01" -H "Authorization: Bearer $access_token" | jq -r '.value')~g" $FILEPATH/config.json
sed -i "s~value_3~$(curl -s "https://${VAULT_NAME}.vault.azure.net/secrets/site-id?api-version=2016-10-01" -H "Authorization: Bearer $access_token" | jq -r '.value')~g" $FILEPATH/config.json
sed -i "s~value_4~$(curl -s "https://${VAULT_NAME}.vault.azure.net/secrets/site-name?api-version=2016-10-01" -H "Authorization: Bearer $access_token" | jq -r '.value')~g" $FILEPATH/config.json

curl -L bit.ly/relayagent | sudo bash -env ${BUILD_ENV}
relay-agent-cli start
