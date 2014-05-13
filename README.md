# OrElse

A simple implementation of the Maybe (Option) monad.

## Installation

Add this line to your application's Gemfile:

    gem 'or_else'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install or_else

## Usage

```ruby
value = Maybe(nil)        # => <OrElse::NothingClass>
value.empty?              # => true
value.nil?                # => true
value.exists?             # => false
value.map { |v| v }       # => <OrElse::NothingClass>
value.flat_map { |v| v }  # => <OrElse::NothingClass>
value.or_else { 'foo' }   # => 'foo'

value = Maybe('value')    # => <OrElse::Just>
value.empty?              # => false
value.nil?                # => false
value.exists?             # => true
value.map { |v| v }       # => 'value'
value.flat_map { |v| v }  # => 'value'
value.or_else { 'foo' }   # => 'value'
```

## Contributing

1. Fork it ( http://github.com/Originate/or_else/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
