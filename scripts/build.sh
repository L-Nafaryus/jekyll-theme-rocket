#!/usr/bin/env bash

set -xeo pipefail

gem install bundler

bundle install

bundle exec jekyll build
bundle exec htmlproofer ./_site --check-html --check-sri
bundle exec rubocop -D --config .rubocop.yml
bundle exec scripts/validate-html.rb

gem build jekyll-theme-rocket.gemspec
