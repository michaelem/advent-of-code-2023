require "test/test_helper"

class Day3::Part2Test < Minitest::Test
  def setup
    @part_2 = Day3::Part2.new()
  end

  def test_run_part_2
    assert_equal "467835", @part_2.run("test/day_3/input_1.txt")
  end
end
