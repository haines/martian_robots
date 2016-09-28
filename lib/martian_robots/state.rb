module MartianRobots
  class State
    attr_reader :x, :y, :orientation

    def initialize(x:, y:, orientation:)
      @x = x
      @y = y
      @orientation = orientation
    end

    def to_s
      "#{x} #{y} #{orientation}"
    end

    def ==(other)
      values == other.values
    end

    alias_method :eql?, :==

    def hash
      values.hash
    end

    protected

    def values
      [x, y, orientation]
    end
  end
end
