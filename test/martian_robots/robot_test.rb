require_relative "../test_helper"
require "martian_robots/robot"

module MartianRobots
  class RobotTest < Minitest::Test
    def setup
      @world = spy(:world, scent_present?: false)
    end

    def test_a_robot_has_an_initial_state
      initial_state = valid_state(:initial_state)
      robot = Robot.new(state: initial_state, world: @world)

      assert_equal initial_state, robot.state
    end

    def test_a_robot_updates_its_state_by_executing_a_valid_instruction
      initial_state = valid_state(:initial_state)
      final_state = valid_state(:final_state)
      robot = Robot.new(state: initial_state, world: @world)

      robot.execute change_state(from: initial_state, to: final_state)

      assert_equal final_state, robot.state
    end

    def test_a_new_robot_is_not_lost
      robot = Robot.new(state: valid_state(:initial_state), world: @world)

      refute robot.lost?
    end

    def test_a_robot_becomes_lost_by_executing_an_invalid_instruction
      initial_state = valid_state(:initial_state)
      robot = Robot.new(state: initial_state, world: @world)

      robot.execute change_state(from: initial_state, to: invalid_state(:final_state))

      assert robot.lost?
    end

    def test_a_lost_robot_ignores_further_instructions
      initial_state = valid_state(:initial_state)
      robot = Robot.new(state: initial_state, world: @world)

      robot.execute change_state(from: initial_state, to: invalid_state(:final_state))

      robot.execute ->(_) { flunk "Executed an instruction after robot was lost" }
    end

    def test_a_lost_robot_remembers_its_last_valid_state
      initial_state = valid_state(:initial_state)
      robot = Robot.new(state: initial_state, world: @world)

      robot.execute change_state(from: initial_state, to: invalid_state(:final_state))

      assert_equal initial_state, robot.state
    end

    def test_losing_a_robot_leaves_a_scent
      initial_state = valid_state(:initial_state)
      robot = Robot.new(state: initial_state, world: @world)
      instruction = change_state(from: initial_state, to: invalid_state(:final_state))

      robot.execute instruction

      expect(@world).to have_received(:add_scent).with(state: initial_state, instruction: instruction)
    end

    def test_a_robot_ignores_an_instruction_if_a_scent_is_present
      initial_state = valid_state(:initial_state)
      robot = Robot.new(state: initial_state, world: @world)
      instruction = ->(_) { flunk "Executed an instruction despite the presence of a scent" }
      allow(@world).to receive(:scent_present?).with(state: initial_state, instruction: instruction).and_return(true)

      robot.execute instruction
    end

    private

    def valid_state(name)
      state_double(name, valid: true)
    end

    def invalid_state(name)
      state_double(name, valid: false)
    end

    def state_double(name, valid:)
      double(name).tap do |state|
        allow(@world).to receive(:allow?).with(state).and_return(valid)
      end
    end

    def change_state(from:, to:)
      ->(state) {
        assert_equal from, state
        to
      }
    end
  end
end
