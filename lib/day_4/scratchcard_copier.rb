class Day4::ScratchcardCopier
  def initialize(cards)
    @original_cards = cards
  end

  def copy_card(card)
    if card.matches > 0
      new_cards = @original_cards[card.id..card.id+card.matches-1]
    else
      new_cards = []
    end

    new_cards.each do |other_card|
      new_cards += copy_card(other_card)
    end
    new_cards
  end
end