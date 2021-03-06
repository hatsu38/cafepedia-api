FROM ruby:2.6.5-slim-buster

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    vim locales build-essential \
    libpq-dev \
    postgresql-client \
    nodejs npm &&\
    npm install -g yarn &&\
    rm -f /etc/localtime &&\
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    echo 'Asia/Tokyo' > /etc/timezone &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*


ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile Gemfile.lock package.json yarn.lock $APP_ROOT/

RUN gem update --system && gem install bundler:1.17.3

RUN RAILS_ENV=production bundle install

ADD . $APP_ROOT

# RUN RAILS_ENV=production bundle exec rake assets:clobber
# RUN RAILS_ENV=production bundle exec rails assets:precompile

EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]
