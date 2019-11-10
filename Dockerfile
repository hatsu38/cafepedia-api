FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       postgresql-client \
                       vim \
                       nodejs

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV}

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler:2.0.2

RUN bundle install

ADD . $APP_ROOT

RUN if [ "${RAILS_ENV}" = "production" ]; then bundle exec rails assets:precompile; else export RAILS_ENV=development; fi

EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]
