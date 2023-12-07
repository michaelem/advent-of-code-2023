require "test/test_helper"

class Day1::TrebuchetTest < Minitest::Test
  def setup
    @trebuchet = Day1::Trebuchet.new()
  end

  def test_run_part_1
    assert_equal "142", @trebuchet.run("test/day_1/input_1.txt")
  end

  def test_run_part_2
    assert_equal "281", @trebuchet.run("test/day_1/input_2.txt")
  end
end
