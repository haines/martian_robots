require_relative "../test_helper"
require "martian_robots/application"

module MartianRobots
  class ApplicationTest < Minitest::Test
    def test_the_application_parses_input_and_produces_the_correct_output
      output = StringIO.new

      File.open(sample_file("input")) do |input|
        Application.run input: input, output: output
      end

      assert_equal File.read(sample_file("output")), output.string
    end

    private

    def sample_file(name)
      File.expand_path("../sample_#{name}.txt", __dir__)
    end
  end
end
