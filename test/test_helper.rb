$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "minitest/autorun"
require "rspec/mocks/minitest_integration"
