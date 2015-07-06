# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bothersme_list/version'

Gem::Specification.new do |spec|
  spec.name          = "bothersme_list"
  spec.version       = BothersmeList::VERSION
  spec.authors       = ["Bothers.Me"]
  spec.email         = ["artem+gem@bothers.me"]
  spec.summary       = %q{Inserts 'Report an Issue' button}
  spec.description   = %q{Adds 'Report an Issue' button to your website to allow reporting issues published on bothers.me}
  spec.homepage      = "http://bothers.me"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.rubyforge_project = "bothersme_list"

  # For development / Code coverage / Documentation
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'coveralls'
end
