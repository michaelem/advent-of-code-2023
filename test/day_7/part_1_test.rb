require "test/test_helper"

class Day7::Part1Test < Minitest::Test
  def setup
    @part = Day7::Part1.new
  end

  def test_run
    assert_equal "6440", @part.run("test/day_7/input.txt")
  end
end
