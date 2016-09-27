require_relative "../test_helper"
require "martian_robots/state"

module MartianRobots
  class StateTest < Minitest::Test
    def test_states_are_equal_if_all_their_fields_are_equal
      assert State.new(x: 42, y: 100, orientation: :N) == State.new(x: 42, y: 100, orientation: :N)
    end

    def test_states_are_not_equal_if_their_xs_are_not_equal
      refute State.new(x: 41, y: 100, orientation: :N) == State.new(x: 42, y: 100, orientation: :N)
    end

    def test_states_are_not_equal_if_their_ys_are_not_equal
      refute State.new(x: 42, y: 99, orientation: :N) == State.new(x: 42, y: 100, orientation: :N)
    end

    def test_states_are_not_equal_if_their_orientations_are_not_equal
      refute State.new(x: 42, y: 100, orientation: :S) == State.new(x: 42, y: 100, orientation: :N)
    end

    def test_states_have_the_same_hash_if_all_their_fields_are_equal
      assert_equal State.new(x: 42, y: 100, orientation: :N).hash, State.new(x: 42, y: 100, orientation: :N).hash
    end

    def test_states_have_different_hashes_if_their_xs_are_not_equal
      refute_equal State.new(x: 41, y: 100, orientation: :N).hash, State.new(x: 42, y: 100, orientation: :N).hash
    end

    def test_states_have_different_hashes_if_their_ys_are_not_equal
      refute_equal State.new(x: 42, y: 99, orientation: :N).hash, State.new(x: 42, y: 100, orientation: :N).hash
    end

    def test_states_have_different_hashes_if_their_orientations_are_not_equal
      refute_equal State.new(x: 42, y: 100, orientation: :S).hash, State.new(x: 42, y: 100, orientation: :N).hash
    end
  end
end
