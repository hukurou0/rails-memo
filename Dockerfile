FROM ruby:3.3

WORKDIR /service

# GemfileとGemfile.lockファイルを
# イメージのserviceディレクトリ内にコピー
COPY Gemfile* /service/

RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
