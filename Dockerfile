FROM ruby:2.4.1

RUN rm -f /etc/apt/sources.list.d/* && \
  echo "deb [check-valid-until=no trusted=yes] http://archive.debian.org/debian jessie main" > /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update -qq && \
  apt-get install -y --no-install-recommends \
  build-essential \
  libsqlite3-dev \
  sqlite3 \
  shared-mime-info \
  curl \
  gnupg && \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y --allow-unauthenticated nodejs && \
  update-mime-database /usr/share/mime && \
  gem install bundler -v 1.16.1 && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
# Para funcionar no M1
RUN bundle config set force_ruby_platform true
RUN bundle install
COPY . /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install
ADD . /app