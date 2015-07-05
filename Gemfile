source 'https://rubygems.org'

# Specify your gem's dependencies in bothersme_list.gemspec
gemspec

gem "rake"
gem "bundler"

group :test do
  gem "rspec"

  if ENV["CI"]
    gem "coveralls", require: false
  end
end