#!/bin/bash

# 変数の読み込み
source variables.conf

# container registry の作成
if [ -z "$CONTAINER_REGISTRY" ]; then
  acrName=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w ${1:-32} | head -n 1 | cut -c 1-49)
else
  acrName=$CONTAINER_REGISTRY
fi
az acr create \
  --resource-group $RESOURCE_GROUP \
  --name $acrName \
  --sku Basic \
  --location $LOCATION

echo "-----container registry name-----"
echo $acrName
echo "ACR_NAME=${acrName}" > acrName.txt
echo "--------------------------------"
echo "create container registry"

az acr login --name $acrName

echo "login container registry"

echo "complete container_start.sh"
