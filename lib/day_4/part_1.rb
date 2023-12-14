class Day4::Part1
  def run(input)
    IO
      .readlines(input)
      .map { |card_string| Day4::Scratchcard.new(card_string).score }
      .sum
      .to_s
  end
end
