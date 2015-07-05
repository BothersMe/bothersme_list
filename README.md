# Bothersme List [![Build Status](https://travis-ci.org/BothersMe/bothersme_list.svg?branch=master)](https://travis-ci.org/BothersMe/bothersme_list) [![Code Climate](https://codeclimate.com/github/BothersMe/bothersme_list/badges/gpa.svg)](https://codeclimate.com/github/BothersMe/bothersme_list)

 Inserts "Track an Issue" button on a side

 Parameters:
 1. type: 'website', 'camera', 'wearable'
 2. company: 'YourCompanyName'
 3. product: 'YourProductName' or nil if used for all products


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

At the end of your layout (usually application.hmtl.erb file) before ```</body>``` add
```ruby
  <%= issues_list('website', 'MyWebsite.com', 'MyProduct') %>
```

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
