# Exit immediately if a command exits with a non-zero status.
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

echo "Build successful!"
