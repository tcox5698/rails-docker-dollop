#!/usr/bin/env bash

bundle install
rails db:drop
rails db:setup
rails test