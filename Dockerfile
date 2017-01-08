FROM ruby:2.3
MAINTAINER tcox5698@gmail.com

RUN pwd
RUN ls -larth

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get remove -y nodejs && apt-get install -y \
  nodejs \
  build-essential \
  postgresql \
  postgresql-contrib \
  nano \
  less

RUN npm install phantomjs-prebuilt

RUN gem install rails

RUN mkdir -p /localdev
WORKDIR /localdev

RUN rails new project_shell  --database=postgresql --skip-test

WORKDIR /localdev/project_shell

RUN mkdir -p /tmp/config_templates
COPY config_templates/* /tmp/config_templates/

RUN cat /tmp/config_templates/Gemfile_partial.txt >> Gemfile
RUN bundle install && bundle exec spring binstub --all
RUN rails g rspec:install

RUN mkdir -p /app
WORKDIR /app

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

ENV PATH $PATH:/node_modules/.bin

RUN ls -larth /home

CMD [ "irb" ]