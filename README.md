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
value = Maybe(nil)              # => Nothing
value.empty?                    # => true
value.nil?                      # => true
value.exists?                   # => false
# Block is ignored
value.map { |v| v }             # => Nothing
# Block is ignored
value.flat_map { |v| Maybe(v) } # => Nothing
# Returns the result of the block
value.or_else { 'foo' }         # => 'foo'

value = Maybe('value')          # => <OrElse::Just>
value.empty?                    # => false
value.nil?                      # => false
value.exists?                   # => true
# Block is yielded the bare value and the result of the block is wrapped in a Maybe
value.map { |v| v }             # => <OrElse::Just>
# Block is yielded the bare value, and the block exists with a Maybe so it is left as is
value.flat_map { |v| Maybe(v) } # => <OrElse::Just> (Block is yielded the bare value)
# Block is yielded the bare value, but did not exit with a Maybe so it is wrapped
value.flat_map { |v| v }        # => <OrElse::Just>
# Block is ignored
value.or_else { 'foo' }         # => 'value'
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
