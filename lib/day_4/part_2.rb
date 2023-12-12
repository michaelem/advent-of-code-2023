class Day4::Part2
  def run(input)
    cards = IO.readlines(input).map do |card_string|
      Day4::Scratchcard.new(card_string)
    end

    copier = Day4::ScratchcardCopier.new(cards)
    new_cards = cards.map { |card| copier.copy_card(card) }.flatten
    
    (cards + new_cards).count.to_s
  end
end
