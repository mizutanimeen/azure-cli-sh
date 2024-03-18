#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 image_name image_tag"
    exit 1
fi

source acrName.txt

if [ -z "$ACR_NAME" ]; then
    echo "acrName.txt ACR_NAME is not set"
    exit 1
fi

docker tag $1 $ACR_NAME.azurecr.io/$1:$2
docker push $ACR_NAME.azurecr.io/$1:$2

echo "complete image_push.sh"
