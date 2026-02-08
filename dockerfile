FROM ruby:3.4.1

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Set working directory
WORKDIR /app

# Copy Gemfiles first (layer caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose Rails port
EXPOSE 3000

# Start the Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
