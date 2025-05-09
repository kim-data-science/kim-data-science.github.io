#!/bin/zsh

# Initialize rbenv
export PATH="/opt/homebrew/bin:$PATH"
eval "$(rbenv init -)"

# Ensure we're using the correct Ruby version
rbenv global 3.4.3

# Show Ruby version info
which ruby
ruby -v

# Clean and install dependencies
rm -rf vendor/bundle .bundle Gemfile.lock
gem install bundler:2.6.8

# Install gems and run Jekyll
bundle install
bundle exec jekyll serve