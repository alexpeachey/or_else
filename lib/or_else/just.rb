module OrElse
  class Just < Maybe
    def initialize(val)
      @value = val
    end

    def map
      Just(yield value)
    end

    def flat_map
      Maybe(yield value)
    end

    def filter
      (yield value) ? self : Nothing
    end

    def empty?
      false
    end

    def exists?
      !empty?
    end

    def present?
      exists?
    end

    def or_else
      value
    end

    def each
      yield value
      nil
    end

    def all?
      !!(yield value)
    end

    def any?(&block)
      all?(&block)
    end

    private

    attr_reader :value
  end
end

def Just(val)
  OrElse::Just.new(val)
end
