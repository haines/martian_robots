require "set"

module MartianRobots
  class World
    def initialize(width:, height:)
      @width = width
      @height = height
      @scents = Set.new
    end

    def allow?(state)
      state.x.between?(0, width) && state.y.between?(0, height)
    end

    def add_scent(state:, instruction:)
      scents.add [state, instruction]
    end

    def scent_present?(state:, instruction:)
      scents.include?([state, instruction])
    end

    private

    attr_reader :width, :height, :scents
  end
end
