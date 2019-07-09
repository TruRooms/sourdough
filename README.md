# Sourdough
[![Build Status](https://travis-ci.com/TruRooms/sourdough.svg?branch=master)](https://travis-ci.com/TruRooms/sourdough)[![Maintainability](https://api.codeclimate.com/v1/badges/34681a541f847ea541af/maintainability)](https://codeclimate.com/github/TruRooms/sourdough/maintainability)[![Test Coverage](https://api.codeclimate.com/v1/badges/34681a541f847ea541af/test_coverage)](https://codeclimate.com/github/TruRooms/sourdough/test_coverage)

An api wrapper for the Bread Financing Backend API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sourdough'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sourdough

## Usage

### Configuration

This gem expects your api key and secret key to be configured. An optional 3rd param tells Sourdough whether to run against the sandbox API or the production version. This can be included in a Rails initializer.
```ruby
Sourdough.api_key = 'MY_API_KEY'
Sourdough.secret_key = 'MY_SECRET_KEY'
Sourdough.sandbox = true # OPTIONAL
```

### Endpoints

Where possible, an endpoint will return an instance of the object as a convenience. EG `cart = Sourdough::Cart.find('1'); cart.email`

#### Transactions

#### Carts

##### .find(cart_id)
```ruby
Sourdough.cart.find('1')
##<Sourdough::Cart:0x00007feb8c995f78
 #@body=
  #{"id"=>"1",
   #"cartName"=>"Untitled",
   #"createdBy"=>"ben",
   #"expiration"=>"2100-01-01",
   #"url"=>"https://checkout.getbread.com/dfdsa",
   #"isCustomTotal"=>true,
   #"options"=>{},
 #@id="1">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TruRoomsInc/sourdough. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Sourdough project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/TruRoomsInc/sourdough/blob/master/CODE_OF_CONDUCT.md).
