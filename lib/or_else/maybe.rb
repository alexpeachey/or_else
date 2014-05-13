require 'or_else/just'
require 'or_else/nothing_class'

def Maybe(val)
  return Nothing if val.nil?
  OrElse::Just.new(val)
end

class Object
  def maybe
    Maybe(self)
  end
end