FROM ruby:2.3
MAINTAINER tcox5698@gmail.com

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

RUN apt-get install -y \
  postgresql \
  postgresql-contrib \
  nano \
  less

RUN gem install rails

RUN mkdir -p /localdev
WORKDIR /localdev

RUN rails new project_shell  --database=postgresql --skip-test

WORKDIR /localdev/project_shell

RUN echo "gem 'rspec-rails'" >> Gemfile
RUN bundle install && bundle exec spring binstub --all
RUN rails g rspec:install

RUN mkdir -p /app
WORKDIR /app

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

CMD [ "irb" ]