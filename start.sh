#!/bin/bash

# 変数の読み込み
source variables.conf

# リソースグループの作成
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

echo "create resource group"

# リソースグループにContainer Apps 環境を作成
az containerapp env create \
  --name $CONTAINERAPPS_ENVIRONMENT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

echo "create container apps environment"

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
