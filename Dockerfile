FROM ruby:alpine
ENV BUNDLER_VERSION=2.2.15

RUN gem install bundler -v 2.2.15

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE 3000

CMD ["/bin/sh"]
