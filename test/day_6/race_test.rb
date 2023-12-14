require "test/test_helper"

class Day6::RaceTest < Minitest::Test
  def setup
    @race_1 = Day6::Race.new(7, 9)
  end

  def test_compete
    assert_equal 0, @race_1.compete(0)
    assert_equal 6, @race_1.compete(1)
    assert_equal 10, @race_1.compete(2)
    assert_equal 12, @race_1.compete(3)
    assert_equal 12, @race_1.compete(4)
    assert_equal 10, @race_1.compete(5)
    assert_equal 6, @race_1.compete(6)
    assert_equal 0, @race_1.compete(7)
  end

  def test_winning_charge_times
    assert_equal [2, 3, 4, 5], @race_1.winning_charge_times
  end
end
