require "test/test_helper"

class Day3::Part1Test < Minitest::Test
  def setup
    @part_1 = Day3::Part1.new()
  end

  def test_run_part_1
    assert_equal "4361", @part_1.run("test/day_3/input_1.txt")
  end
end
