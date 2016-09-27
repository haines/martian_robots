$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
