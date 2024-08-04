# Exit immediately if a command exits with a non-zero status.
set -e

# Install dependencies
bundle install

# Precompile assets
bundle exec rake assets:precompile

echo "Build successful!"
