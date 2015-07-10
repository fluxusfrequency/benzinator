# Benzinator

## Installation

Add this line to your application's Gemfile:
This is a sample gem to wrap an imaginary car buying application API. It
is meant to accompany a [blog post](https://blog.engineyard.com/2014/wrapping-your-api-in-a-ruby-gem) written for EngineYard and Quick Left.

## Installation

If this gem actually talked to a service, you could use it in your Ruby
project. To do so, you would add this line to your application's Gemfile:

    gem 'benzinator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install benzinator

## Usage

To get access to the cars for sale on Ben's Benzes, you would do this:

```ruby
require 'benzinator'

# Find all the cars
cars = Benzinator::Car.all

# Find a car by id
honda = Benzinator::Car.find(68)

# Access the car's attributes
honda.id
#=> 68

honda.year
#=>1996

honda.color
#=> "Blue"

```

Enjoy!
