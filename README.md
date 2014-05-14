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
# Nothings
value = Maybe(nil)                  # => Nothing
Maybe(nil).empty?                   # => true
Maybe(nil).nil?                     # => true
Maybe(nil).exists?                  # => false
# Block is ignored
Maybe(nil).map { |v| v }            # => Nothing
# Block is ignored
Maybe(nil).flat_map { |v| v }       # => Nothing
# Returns the result of the block
Maybe(nil).or_else { 'foo' }        # => 'foo'

# Justs
Maybe('value')                      # => Just('value')
Maybe('value').empty?               # => false
Maybe('value').nil?                 # => false
Maybe('value').exists?              # => true
Maybe('value').map { |v| v }        # => Just('value')
Maybe('value').flat_map { |v| v }   # => Maybe('value')
# Block is ignored
Maybe('value').or_else { 'foo' }    # => 'value'

#more examples
Maybe(1).map { |v| nil }            # => Just(nil)
Maybe(1).map { |v| Maybe(v) }       # => Just(Maybe(1))
Maybe(1).flat_map { |v| nil }       # => Nothing
Maybe(1).flat_map { |v| Maybe(v) }  # => Maybe(1)
```

Real life example:

```
comment = Maybe(post.comments.first).or_else { post.comments.build }
```

## Contributing

1. Fork it ( http://github.com/Originate/or_else/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
