class Day4::Part1
  def run(input)
    IO.readlines(input).map do |card_string|
      Day4::Scratchcard.new(card_string).calculate_score
    end.sum.to_s
  end
end
