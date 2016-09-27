require_relative "../test_helper"
require "martian_robots/world"

module MartianRobots
  class WorldTest < Minitest::Test
    def test_the_bottom_left_corner_is_allowed
      world = World.new(width: 42, height: 100)

      assert world.allow?(at(x: 0, y: 0))
    end

    def test_the_top_right_corner_is_allowed
      world = World.new(width: 42, height: 100)

      assert world.allow?(at(x: 42, y: 100))
    end

    def test_somewhere_in_the_middle_is_allowed
      world = World.new(width: 42, height: 100)

      assert world.allow?(at(x: 36, y: 49))
    end

    def test_negative_x_is_not_allowed
      world = World.new(width: 42, height: 100)

      refute world.allow?(at(x: -1, y: 0))
    end

    def test_excessive_x_is_not_allowed
      world = World.new(width: 42, height: 100)

      refute world.allow?(at(x: 43, y: 0))
    end

    def test_negative_y_is_not_allowed
      world = World.new(width: 42, height: 100)

      refute world.allow?(at(x: 0, y: -1))
    end

    def test_excessive_y_is_not_allowed
      world = World.new(width: 42, height: 100)

      refute world.allow?(at(x: 0, y: 101))
    end

    def test_a_world_tracks_scents
      world = World.new(width: 42, height: 100)

      state_1 = double(:state_1)
      instruction_1 = double(:instruction_1)
      world.add_scent state: state_1, instruction: instruction_1

      state_2 = double(:state_2)
      instruction_2 = double(:instruction_2)
      world.add_scent state: state_2, instruction: instruction_2

      assert world.scent_present?(state: state_1, instruction: instruction_1)
      assert world.scent_present?(state: state_2, instruction: instruction_2)
      refute world.scent_present?(state: state_1, instruction: instruction_2)
      refute world.scent_present?(state: state_2, instruction: instruction_1)
    end

    private

    def at(x:, y:)
      double(:state, x: x, y: y)
    end
  end
end
