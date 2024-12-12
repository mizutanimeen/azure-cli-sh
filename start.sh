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

echo "complete start.sh"
