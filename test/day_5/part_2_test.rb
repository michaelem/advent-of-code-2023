require "test/test_helper"

class Day5::Part2Test < Minitest::Test
  def setup
    @part_2 = Day5::Part2.new()
  end

  def test_run_part_2
    assert_equal "46", @part_2.run("test/day_5/input.txt")
  end
end
