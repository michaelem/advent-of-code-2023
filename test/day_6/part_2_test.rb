require "test/test_helper"

class Day6::Part2Test < Minitest::Test
  def setup
    @part_2 = Day6::Part2.new()
  end

  def test_run_part_2
    assert_equal "71503", @part_2.run("test/day_6/input.txt")
  end
end
