# Cafepedia API

<!-- 旧URL -->
<!-- BaseURL：https://api.cafepedia.jp/ -->
BaseURL：https://cafepedia-api.herokuapp.com/

## Relation
<!-- 旧構成 -->
<!-- Infrastructure：https://github.com/hatsu38/cafepedia-api-aws -->

Frontend：https://github.com/hatsu38/cafepedia-frontend

## Overview
#### 日本全国にあるカフェチェーン店の一覧/カフェ詳細を返します
|path|parameter|Description|
|:-|:-|:-|
|/api/shops| |日本全国のカフェチェーン一覧を返します|
|/api/shops/:id| |idのカフェ詳細情報を返します|
|/api/search| ・socket(=boolean) <br/> ・wifi(=boolean) <br /> ・smoking(=boolean) <br /> ・station_name(=string) <br /> ・lat(=float) <br /> ・lng(=float) <br /> ・page(=int) |paramsにヒットするカフェをlat,lngに近い順にソートして30件返します|

#### 都道府県とそのカフェの一部を返す
|path|parameter|Description|
|:-|:-|:-|
|/api/prefectures| |都道府県一覧とカフェ5つを返します|
|/api/prefectures/:id| |idの都道府県とそのカフェ一覧を返します|
|/api/areas/ | |地方一覧を返します|
|/api/areas/:area | |地方名にマッチした都道府県一覧とそのカフェを返します|

#### お店のコメントを返します/投稿できます
|path|parameter|Description|
|:-|:-|:-|
|/api/shops/:shop_id/comments(get)| page(=int) | shopに紐付くコメントを最新順に3件返します|
|/api/shops/:shop_id/comments(post)| ・name(=string) <br /> ・content(=string) <br /> ・is_complete(=boolean) <br />  ・shop_id(=int)| shopに紐付くコメントを追加します|

#### 駅名あいまい検索
|path|parameter|Description|
|:-|:-|:-|
|/api/stations/search| ・word(=string)<br /> ・page(=int)| wordを含む駅名を10件返します |


### デプロイ方法
新：
```
# herokuにログイン
$ heroku login

# Masterブランチをデプロイ
git push heroku master

# DBセットアップ(必要に応じて)
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
