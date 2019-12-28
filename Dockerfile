FROM ruby:2.7-rc

WORKDIR /home/super-awesome-api/

COPY Gemfile* ./

RUN gem install bundler -v 1.11.2 && \
  bundle install --jobs 20 --retry 5

COPY . .

ARG RAILS_ENV="development"
ARG BASE_DOMAIN="lvh.me"
ARG ASSET_HOST="lvh.me"

ENV RAILS_ENV $RAILS_ENV
ENV BASE_DOMAIN $BASE_DOMAIN
ENV APP_HOME .