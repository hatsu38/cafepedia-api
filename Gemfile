# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem "puma_worker_killer", require: false #pumaのworkjerプロセスが規定のメモリ使用量を超えた時に自動でそのプロセスを殺して再起動する
# scout_apmと競合するためコメントアウト
# gem 'newrelic_rpm' # newrelicによる監視
gem 'fog-aws', require: false
gem 'carrierwave'
gem 'sitemap_generator' # Sitemap作成
gem 'aws-sdk-s3' # s3にsitemapを設置
gem 'dotenv-rails'
gem 'active_hash'
gem 'sentry-raven'
gem 'activeadmin'
gem 'devise'
gem 'kaminari'
gem 'rack-cors', require: false
gem 'rails-i18n'
gem 'order_as_specified' #Whre句の結果順にOrderする
gem 'jb' # jsonを生成する(jbuilderから移行した)
gem 'scout_apm' # rails appのパフォーマスモニタリング
gem 'redis' # キャッシュを保存する
gem 'hiredis' # Redisのより高速なgem。hiredisが使えるときに自動で使われる
# gem 'redis-rails' # キャッシュを保存する

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'foreman'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop-thread_safety'
  gem 'simplecov'
  gem 'brakeman'
  gem 'bullet'
  gem 'annotate' # Add Column Info To model file
end

group :development do
  gem 'rack-mini-profiler', require: false # パフォーマンス計測
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'ci_reporter_rspec'
  gem 'factory_bot_rails'
  gem 'factory_bot-preload'
  gem 'database_cleaner'
  gem 'database_rewinder'
  gem 'shoulda-matchers'
  gem 'brakeman'
  gem 'rubycritic'
  gem 'capybara'
end


gem 'tzinfo-data'
