FROM ruby:3.2.3

WORKDIR /service

# Install dependencies for sassc
RUN apt-get update -qq && \
    apt-get install -y build-essential libsass-dev

# GemfileとGemfile.lockファイルを
# イメージのserviceディレクトリ内にコピー
COPY service/Gemfile* /service/

RUN bundle install

# アプリケーションのコードをコピー
COPY service /service/

# アセットのプリコンパイル
RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
