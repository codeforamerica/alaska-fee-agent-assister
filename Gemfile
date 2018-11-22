source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "rails", "~> 5.2.1"

gem "administrate"
gem "administrate-field-enum"
gem "bootsnap", ">= 1.1.0", require: false
gem "cfa-styleguide", git: "https://github.com/codeforamerica/cfa-styleguide-gem"
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "pdf-forms"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "rails-controller-testing"
  gem "rspec-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"
  gem "capybara-selenium"
  gem "chromedriver-helper"
  gem "rspec_junit_formatter"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
