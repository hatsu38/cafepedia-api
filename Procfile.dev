# foreman の設定ファイル。dockerでのrails起動に使う。
# rails 起動前に pidファイルを削除する。じゃないと、前回停止時に残ってしまうことがあるので起動できない。
web: rm -vf tmp/pids/server.pid && bundle exec rails server -p 3000 -b 0.0.0.0 # rails 起動
webpacker: bin/webpack-dev-server # webpack dev serverを起動。port は3035がデフォルト
