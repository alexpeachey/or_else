module OrElse
  class Just < Maybe

    attr_reader :value

    def initialize(val)
      @value = val
    end

    def map
      Just(yield value)
    end

    def flat_map
      Maybe(yield value)
    end

    def empty?
      false
    end

    def exists?
      !empty?
    end

    def or_else
      value
    end
  end
end

def Just(val)
  OrElse::Just.new(val)
end
