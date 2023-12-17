class Day7::Game
  def initialize(hands)
    @hands = hands
  end

  def sorted
    @hands.sort
  end

  def winnings
    sorted.map.with_index(1) { |hand, index| hand.bid * index }
  end
end
