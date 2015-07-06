# Bothersme List
[![Build Status](https://travis-ci.org/BothersMe/bothersme_list.svg?branch=master)](https://travis-ci.org/BothersMe/bothersme_list)
[![Code Climate](https://codeclimate.com/github/BothersMe/bothersme_list/badges/gpa.svg)](https://codeclimate.com/github/BothersMe/bothersme_list)
[![Coverage Status](https://coveralls.io/repos/BothersMe/bothersme_list/badge.svg?branch=master)](https://coveralls.io/r/BothersMe/bothersme_list?branch=master)
[![Dependency Status](https://gemnasium.com/BothersMe/bothersme_list.svg)](https://gemnasium.com/BothersMe/bothersme_list)
[![Online docs](https://img.shields.io/badge/docs-✓-green.svg)](http://www.rubydoc.info/github/BothersMe/bothersme_list/master/BothersmeList)
[![Gem Version](https://img.shields.io/gem/v/bothersme_list.png)](https://rubygems.org/gems/bothersme_list)

Inserts "Track an Issue" button on a side like a button on [http://bothers.me](http://bothers.me)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bothersme_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bothersme_list

## Usage

Add this line to your application's Gemfile:

```ruby
gem 'bothersme_list'
```

At the end of your layout (usually application.hmtl.erb file) before ```</body>``` add
```ruby
  <%= issues_list('website', 'MyWebsite.com', 'MyProduct') %>
```

the script will asynchronously add "Track an Issue" button.

### Parameters
  1. type [String] indicates the type of the product. Supported types are: 'website', 'camera', 'wearable'
  2. company [String] is your company name camel case like 'MyCompany'
  3. product [String] name of your product came case like "My Product", you can pass nil to render issues for all products
  4. side [String] which side to render on, supported 'left', 'right', default: 'right'
  5. textColor [String] CSS color to render as foreground color. default 'white'
  6. bgColor [String] CSS color to render as background color, default '#55B055'


## Contributing

1. Fork it ( https://github.com/BothersMe/bothersme_list/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## CHANGELOG

See [here](CHANGELOG.md).

## Ruby Doc

Is [here](http://www.rubydoc.info/github/BothersMe/bothersme_list/master/BothersmeList)
