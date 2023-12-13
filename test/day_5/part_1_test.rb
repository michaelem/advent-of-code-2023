require "test/test_helper"

class Day5::Part1Test < Minitest::Test
  def setup
    @part_1 = Day5::Part1.new()
  end

  def test_run_part_1
    assert_equal "35", @part_1.run("test/day_5/input.txt")
  end
end
