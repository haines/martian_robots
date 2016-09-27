require "martian_robots/state"

module MartianRobots
  module Instruction
    F = ->(state) {
      State.new(
        x: state.x + DELTA_X.fetch(state.orientation),
        y: state.y + DELTA_Y.fetch(state.orientation),
        orientation: state.orientation
      )
    }

    L = ->(state) {
      State.new(x: state.x, y: state.y, orientation: TURN_LEFT.fetch(state.orientation))
    }

    R = ->(state) {
      State.new(x: state.x, y: state.y, orientation: TURN_RIGHT.fetch(state.orientation))
    }

    DELTA_X = {N: 0, E: 1, S: 0, W: -1}
    DELTA_Y = {N: 1, E: 0, S: -1, W: 0}
    TURN_RIGHT = {N: :E, E: :S, S: :W, W: :N}
    TURN_LEFT = TURN_RIGHT.invert
    private_constant :DELTA_X, :DELTA_Y, :TURN_RIGHT, :TURN_LEFT
  end
end
