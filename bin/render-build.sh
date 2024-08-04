#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install dependencies
bundle install

# Run any other build steps here
# For example, you might need to run database migrations
# bundle exec rake db:migrate

echo "Build successful!"
