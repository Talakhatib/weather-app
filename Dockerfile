# syntax=docker/dockerfile:1
FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /weather_app
COPY Gemfile /weather_app/Gemfile
COPY Gemfile.lock /weather_app/Gemfile.lock
RUN bundle install

EXPOSE 3000

# Configure the main process to run when running the image
CMD bundle exec rails server