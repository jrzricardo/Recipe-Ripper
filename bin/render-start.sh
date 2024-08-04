# Exit immediately if a command exits with a non-zero status.
set -e

# Start the Rails server
bundle exec rails server -b 0.0.0.0 -p $PORT
