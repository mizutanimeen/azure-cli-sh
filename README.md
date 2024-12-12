### cliをコマンド実行可能状態(初回のみ)
```
bash setup.sh
```

### ログイン(初回以降)
```
az login
```

### リソースグループ、container app 環境
```
bash start.sh
```

### container registryを作成、container registryにログイン
```
bash container_start.sh
```

### localのdocker imageを container registryにプッシュ
```
bash image_push.sh image_name image_tag
```

### container appsを作成
管理者アカウントをオンに
```
bash container_app.sh container_app_name image_name:image_tag port registry_password
```
