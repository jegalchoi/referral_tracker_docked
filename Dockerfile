FROM ruby:alpine
ENV BUNDLER_VERSION=2.2.15

RUN apt-get update && apt-get install -y nodejs
RUN gem install bundler -v 2.2.15

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./

RUN bundle install

EXPOSE 3000

CMD ["/bin/sh"]
