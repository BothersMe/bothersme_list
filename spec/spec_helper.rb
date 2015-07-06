require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'bothersme_list'

Dir['./spec/**/*.rb'].each {|f| require f}

RSpec.configure do |config|
  config.order = 'random'
  config.run_all_when_everything_filtered = false
  config.alias_it_should_behave_like_to :all_tests_pass_for, ''
  config.alias_it_should_behave_like_to :all_tests_pass_with, 'with'
end

Coveralls.wear!
