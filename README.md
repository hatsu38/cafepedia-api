# Cafepedia API
===

## Overview
#### 日本全国にあるカフェチェーン店の一覧/カフェ詳細を返します
|path|parameter|Description|
|:-|:-|:-|
|/api/shops| |日本全国のカフェチェーン一覧を返します|
|/api/shops/:id| |idのカフェ詳細情報を返します|
|/api/search| ・socket(=boolean) <br/> ・wifi(=boolean) <br /> ・smoking(=boolean) <br /> ・station_name(=string) <br /> ・lat(=float) <br /> ・lng(=float) <br /> ・page(=int) |paramsにヒットするカフェをlat,lngに近い順にソートして30県返します|

#### お店のコメントを返します/投稿できます
|path|parameter|Description|
|:-|:-|:-|
|/api/shops/:shop_id/comments(get)| page(=int) | shopに紐付くコメントを最新順に3件返します|
|/api/shops/:shop_id/comments(post)| ・name(=string) <br /> ・content(=string) <br /> ・is_complete(=boolean) <br />  ・shop_id(=int)| shopに紐付くコメントを追加します|

#### 駅名あいまい検索
|path|parameter|Description|
|:-|:-|:-|
|/api/stations/search| ・word(=string)<br /> ・page(=int)| wordを含む駅名を10件返します |
