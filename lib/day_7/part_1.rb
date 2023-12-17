class Day7::Part1
  def run(input)
    hands = IO.readlines(input).map { |line| Day7::Hand.new(line) }

    game = Day7::Game.new(hands)
    game.winnings.sum.to_s
  end
end
