require "test/test_helper"

class Day6::Part1Test < Minitest::Test
  def setup
    @part_1 = Day6::Part1.new()
  end

  def test_run_part_1
    assert_equal "288", @part_1.run("test/day_6/input.txt")
  end
end
