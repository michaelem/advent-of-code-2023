require "test/test_helper"

class Day5::SeedsTest < Minitest::Test
  def setup
    @seeds = Day5::Seeds.new("seeds: 79 14 55 13")
  end

  def test_seeds
    assert_equal [79, 14, 55, 13], @seeds.seeds
  end
end