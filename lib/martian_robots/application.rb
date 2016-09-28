require "martian_robots/world"
require "martian_robots/robot"
require "martian_robots/state"
require "martian_robots/instruction"

module MartianRobots
  class Application
    def self.run(**args)
      new(args).run
    end

    def initialize(input:, output:)
      @input = input
      @output = output
    end

    def run
      world = read_world

      process_robot(world) until input.eof?
    end

    private

    attr_reader :input, :output

    def read_line
      input.gets.chomp
    end

    def read_world
      width, height = read_line.split

      World.new(width: Integer(width), height: Integer(height))
    end

    def process_robot(world)
      robot = Robot.new(state: read_initial_state, world: world)

      read_instructions.each do |instruction|
        robot.execute instruction
      end

      output.puts robot
    end

    def read_initial_state
      x, y, orientation = read_line.split

      State.new(x: Integer(x), y: Integer(y), orientation: orientation.to_sym)
    end

    def read_instructions
      read_line.chars.map {|instruction| Instruction.const_get(instruction) }
    end
  end
end
