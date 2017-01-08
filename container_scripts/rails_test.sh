#!/usr/bin/env bash

bundle install
bundle exec spring binstub --all
rails db:drop
rails db:setup
bin/rspec