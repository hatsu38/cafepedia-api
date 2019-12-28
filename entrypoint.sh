#!/bin/bash

cd /app

# ローカルやQAで動かす際に必要なgemを入れる必要があるので、入れておく。
RAILS_ENV=${RAILS_ENV:-production} bundle install

# assets:precompile は、RAILS_ENV=productionでコマンド実行時に config/master.key の値を参照する必要がある。
# しかし、dockerイメージビルド時にクレデンシャル情報を渡すと、イメージ内にその環境変数が残ってしまう。
# それを避けるために、起動時にこのコマンドを実行している。
RAILS_ENV=${RAILS_ENV:-production} bundle exec rails assets:precompile

RAILS_ENV=${RAILS_ENV:-production} bundle exec rails server -b 0.0.0.0
