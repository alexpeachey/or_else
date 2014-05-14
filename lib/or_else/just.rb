module OrElse
  class Just < Maybe

    attr_reader :value

    def initialize(val)
      @value = val
    end

    def map
      Maybe(yield value)
    end

    def flat_map
      t = yield value
      t.is_a?(Maybe) ? t : Maybe(t)
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
