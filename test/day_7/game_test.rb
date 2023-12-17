require "test/test_helper"

class Day7::GameTest < Minitest::Test
  def setup
    @lowest_hand = Day7::Hand.new("32T3K 765")
    @game =
      Day7::Game.new(
        [
          @lowest_hand,
          Day7::Hand.new("T55J5 684"),
          Day7::Hand.new("KK677 28"),
          Day7::Hand.new("KTJJT 220"),
          Day7::Hand.new("QQQJA 483")
        ]
      )
  end

  def test_sorted
    assert_equal @lowest_hand, @game.sorted.first
  end

  def test_winnings
    assert_equal [765, 440, 84, 2736, 2415], @game.winnings
  end
end
