FROM ruby:2.6.5-slim-buster

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev vim \
                       postgresql-client \
                       nodejs npm \
                       locales locales-all

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN rm -f /etc/localtime && \
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo 'Asia/Tokyo' > /etc/timezone
ENV LANG ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8
RUN ln -s /usr/bin/cronolog /usr/local/sbin/cronolog

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile Gemfile.lock package.json yarn.lock $APP_ROOT/

RUN gem install bundler:2.0.2

RUN bundle install

ADD . $APP_ROOT

RUN bundle exec rails assets:precompile

EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]
