require "test/test_helper"

class Day4::Part2Test < Minitest::Test
  def setup
    @part_2 = Day4::Part2.new()
  end

  def test_run_part_2
    assert_equal "30", @part_2.run("test/day_4/input.txt")
  end
end
