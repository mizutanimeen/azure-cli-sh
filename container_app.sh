#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 container_app_name image_name:image_tag port registry_password"
    exit 1
fi

app_name = $1
image = $2
port = $((10#$3))
registry_pass = $4

# 変数の読み込み
source variables.conf
source acrName.txt

az containerapp create \
    -n $app_name \
    -g $RESOURCE_GROUP \
    --image $ACR_NAME.azurecr.io/$image \
    --environment $CONTAINERAPPS_ENVIRONMENT \
    --ingress external \
    --target-port $port \
    --registry-server $ACR_NAME.azurecr.io \
    --registry-username $ACR_NAME \
    --registry-password $registry_pass \
    --query properties.configuration.ingress.fqdn
