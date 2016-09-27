$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require "rspec/mocks/minitest_integration"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
