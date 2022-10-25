FROM ruby:alpine
ENV BUNDLER_VERSION=2.2.15

RUN gem install rails bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./

RUN bundle install

EXPOSE 3000

CMD ["/bin/sh"]
