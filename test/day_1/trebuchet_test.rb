require "minitest/autorun"
require "test/test_helper"

class Day1::TrebuchetTest < Minitest::Test
  def setup
    @trebuchet = Day1::Trebuchet.new()
  end

  def test_run
    assert_equal "Day 1 will be a thing soon! (test/day_1/input.txt)", @trebuchet.run("test/day_1/input.txt")
  end
end