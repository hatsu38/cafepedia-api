# Cafepedia API

<!-- 旧URL -->
<!-- BaseURL：https://api.cafepedia.jp/ -->
BaseURL：https://cafepedia-api.herokuapp.com/

## Relation
<!-- 旧構成 -->
<!-- Infrastructure：https://github.com/hatsu38/cafepedia-api-aws -->

Frontend：https://github.com/hatsu38/cafepedia-frontend

## Overview
#### 一覧,詳細
|path|parameter|Description|
|:-|:-|:-|
|/api/v1/prefectures| |都道府県一覧を返します|
|/api/v1/prefectures/:name_e| |ある都道府県のカフェ一覧情報を返します|
|/api/v1/prefectures/:name_e/cities| |ある都道府県のカフェ一覧、市区町村一覧情報を返します|
|/api/v1/prefectures/:name_e/cities/:code| |ある市区町村のお店一覧、カフェ一覧情報を返します|
|/api/v1/prefectures/:name_e/cities/:code/main_shops| |ある市区町村のチェーン店一覧、カフェ一覧を返します
|/api/v1/prefectures/:name_e/cities/:code/main_shops/:eng_name| |ある市区町村のあるチェーン店のカフェ一覧情報を返します|
|/api/v1/prefectures/:name_e/cities/:code/main_shops/:eng_name/shops| |ある市区町村のあるチェーン店のカフェ一覧情報を返します|
|/api/v1/prefectures/:name_e/cities/:code/main_shops/:eng_name/shops/:id| |あるカフェの詳細情報を返します|

#### 多いカフェ
|path|parameter|Description|
|:-|:-|:-|
|/api/v1/popular/cities| |カフェの多い市区町村を返します|
|/api/v1/popular/stations| |カフェの多い駅を返します|
|/api/v1/popular/main_shops| |カフェの多いチェーン店を返します|

#### 検索
|path|parameter|Description|
|:-|:-|:-|
|/api/v1/search/keywords| keyword(=string)| keywordを含む駅、市区町村、カフェ一覧を返します |
|/api/v1/search/positions| lat(=float), lng(=float)| 緯度経度から近い駅、市区町村、カフェ一覧を返します |


### デプロイ方法
新：
```
0. $ git checkout develop

1. versionはよしなに
$ git flow release start 1.0.0

2. version.txtをリリースバージョンに揃える

3. $ git add public/version.txt

4. $ git commit -m "1.0.0"

5. $ git flow release finish 1.0.0

6. $ git push origin master

6. $ git push origin develop

7. $ git push origin 1.0.0

8. herokuにログイン
$ heroku login

9. Masterブランチをデプロイ
git push heroku master

10. DBセットアップ(必要に応じて)
heroku run rails db:migrate
```

旧：Docker
```
# herokuにログイン
$ heroku login

# herokuのコンテナレジストリにログイン
heroku container:login

# イメージを作成してコンテナレジストリにpush
heroku container:push web

# イメージをherokuへデプロイ
heroku container:release web

# DBセットアップ(必要に応じて)
heroku run rails db:migrate
```

### その他Herokuでよく使うコマンド
```
# 実際にアクセス
heroku open

# サーバーに入る
heroku run bash

# RAILS_ENVをProduction環境に変更する
heroku config:add RAILS_ENV=production

# herokuに.envを送信する
# プラグイン追加
heroku plugins:install heroku-config
# .envを送信
heroku config:push
```
