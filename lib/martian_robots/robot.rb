module MartianRobots
  class Robot
    attr_reader :state

    def initialize(state:, world:)
      @state = state
      @world = world
      @lost = false
    end

    def execute(instruction)
      return if lost? || scent_present?(instruction)

      update_state instruction.call(state)

      world.add_scent state: state, instruction: instruction if lost?
    end

    def lost?
      @lost
    end

    def to_s
      "#{state}#{" LOST" if lost?}"
    end

    private

    attr_reader :world

    def scent_present?(instruction)
      world.scent_present?(state: state, instruction: instruction)
    end

    def update_state(new_state)
      if world.allow?(new_state)
        @state = new_state
      else
        @lost = true
      end
    end
  end
end
