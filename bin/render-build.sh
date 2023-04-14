#!/usr/bin/env bash

# Exit on error
set -o errexit

# Install dependencies
bundle install

# Compile assets
bundle exec rake assets:precompile

# Migrate the database
bundle exec rake db:migrate
