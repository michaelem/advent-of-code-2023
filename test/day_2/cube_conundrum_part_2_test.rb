require "test/test_helper"

class Day2::CubeConundrumPart2Test < Minitest::Test
  def setup
    @cube_conundrum = Day2::CubeConundrumPart2.new()
  end

  def test_run_part_1
    assert_equal "2286", @cube_conundrum.run("test/day_2/input_1.txt")
  end
end
