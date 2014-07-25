require 'singleton'

module OrElse
  class NothingClass < Maybe
    include Singleton

    def map
      Nothing
    end

    def flat_map
      Nothing
    end

    def empty?
      true
    end

    def nil?
      empty?
    end

    def exists?
      !empty?
    end

    def present?
      exists?
    end

    def or_else
      yield
    end

    def each
    end

    def all?
      true
    end

    def any?
      all?
    end
  end
end

Nothing = OrElse::NothingClass.instance
