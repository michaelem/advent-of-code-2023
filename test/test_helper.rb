require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.push_dir("test")
loader.setup

require "minitest/autorun"
