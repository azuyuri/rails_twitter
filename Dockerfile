FROM ruby:2.3.3
# mysqlとの連携のために必要なものをインストール
# rmはキャッシュを削除し、イメージのデータ量を削減するため
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      mysql-client \
      libmysqlclient-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
 
WORKDIR /usr/src/app
 
# bundle updateで使うためにコンテナ内に２つのファイルをコピー
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
 
RUN gem install bundler \
  && bundle install --path vendor/bundle
