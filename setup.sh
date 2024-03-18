#!/bin/bash

# Azure CLI の最新化
az upgrade

# ログイン azure
az login

# 拡張機能のインストール
az extension add --name containerapp --upgrade

# 名前空間の作成
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

echo "complete setup.sh"
