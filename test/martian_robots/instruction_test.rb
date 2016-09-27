require_relative "../test_helper"
require "martian_robots/instruction"

module MartianRobots
  class InstructionTest < Minitest::Test
    def test_moving_north
      assert_equal State.new(x: 42, y: 101, orientation: :N),
                   Instruction::F.call(State.new(x: 42, y: 100, orientation: :N))
    end

    def test_moving_east
      assert_equal State.new(x: 43, y: 100, orientation: :E),
                   Instruction::F.call(State.new(x: 42, y: 100, orientation: :E))
    end

    def test_moving_south
      assert_equal State.new(x: 42, y: 99, orientation: :S),
                   Instruction::F.call(State.new(x: 42, y: 100, orientation: :S))
    end

    def test_moving_west
      assert_equal State.new(x: 41, y: 100, orientation: :W),
                   Instruction::F.call(State.new(x: 42, y: 100, orientation: :W))
    end

    def test_turning_right_from_facing_north
      assert_equal State.new(x: 42, y: 100, orientation: :E),
                   Instruction::R.call(State.new(x: 42, y: 100, orientation: :N))
    end

    def test_turning_right_from_facing_east
      assert_equal State.new(x: 42, y: 100, orientation: :S),
                   Instruction::R.call(State.new(x: 42, y: 100, orientation: :E))
    end

    def test_turning_right_from_facing_south
      assert_equal State.new(x: 42, y: 100, orientation: :W),
                   Instruction::R.call(State.new(x: 42, y: 100, orientation: :S))
    end

    def test_turning_right_from_facing_west
      assert_equal State.new(x: 42, y: 100, orientation: :N),
                   Instruction::R.call(State.new(x: 42, y: 100, orientation: :W))
    end

    def test_turning_left_from_facing_north
      assert_equal State.new(x: 42, y: 100, orientation: :W),
                   Instruction::L.call(State.new(x: 42, y: 100, orientation: :N))
    end

    def test_turning_left_from_facing_east
      assert_equal State.new(x: 42, y: 100, orientation: :N),
                   Instruction::L.call(State.new(x: 42, y: 100, orientation: :E))
    end

    def test_turning_left_from_facing_south
      assert_equal State.new(x: 42, y: 100, orientation: :E),
                   Instruction::L.call(State.new(x: 42, y: 100, orientation: :S))
    end

    def test_turning_left_from_facing_west
      assert_equal State.new(x: 42, y: 100, orientation: :S),
                   Instruction::L.call(State.new(x: 42, y: 100, orientation: :W))
    end
  end
end
