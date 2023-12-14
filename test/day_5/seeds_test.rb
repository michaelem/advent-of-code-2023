require "test/test_helper"

class Day5::SeedsTest < Minitest::Test
  def setup
    @seeds = Day5::Seeds.new("seeds: 79 14 55 13")
  end

  def test_seeds
    assert @seeds.in_range?(79)
    assert @seeds.in_range?(92)
    assert @seeds.in_range?(55)
    assert @seeds.in_range?(67)
  end
end
