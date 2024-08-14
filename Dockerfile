# Use the official Ruby image
FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Install bundler
RUN gem install bundler -v '2.5.5'

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Start the application
CMD ["bundle", "exec", "rails", "s"]
