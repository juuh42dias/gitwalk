# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1'
  gem 'pry-meta', '~> 0.0.10'
  gem 'rspec-rails', '~> 6.0'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'webmock', '~> 3.18'

  gem 'brakeman', '~> 5.4'
  gem 'bundler-audit', '~> 0.9.1'
  gem 'rubocop-rails', '~> 2.17'
  gem 'rubocop-rspec', '~> 2.18'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'better_errors', '~> 2.9'
  gem 'binding_of_caller', '~> 1.0'
end

gem 'faraday', '~> 2.7'
gem 'interactor', '~> 3.0'
gem 'sidekiq', '~> 7.0'
