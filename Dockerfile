FROM ruby:alpine

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install --deployment --without development test
COPY . /app

RUN bundle exec rake yarn:install
# Set production environment
ENV RAILS_ENV production
# Assets, to fix missing secret key issue during building
RUN SECRET_KEY_BASE=dumb bundle exec rails assets:precompile
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# Start the main process.
WORKDIR /app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
