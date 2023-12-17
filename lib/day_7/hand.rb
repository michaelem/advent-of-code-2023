class Day7::Hand
  TYPES = %i[
    five_of_a_kind
    four_of_a_kind
    full_house
    three_of_a_kind
    two_pair
    one_pair
    high_card
  ]

  include Comparable

  def initialize(hand_string)
    @cards = create_cards(hand_string.split(" ")[0])
    @bid = hand_string.split(" ")[1].to_i
  end

  attr_reader :cards, :bid

  def type
    occurances =
      @cards.inject({}) do |hash, card|
        hash[card.label] = (hash[card.label] || 0) + 1
        hash
      end

    if occurances.values.include?(5)
      return :five_of_a_kind
    elsif occurances.values.include?(4)
      return :four_of_a_kind
    elsif occurances.values.include?(3) && occurances.values.include?(2)
      return :full_house
    elsif occurances.values.include?(3)
      return :three_of_a_kind
    elsif occurances.values.count(2) == 2
      return :two_pair
    elsif occurances.values.count(2) == 1
      return :one_pair
    else
      return :high_card
    end
  end

  def power
    TYPES.reverse.index(type)
  end

  def <=>(other)
    return 1 if self > other
    return 0 if self == other
    return -1 if self < other
  end

  def >(other)
    if power > other.power
      return true
    elsif power < other.power
      return false
    else # power == other.power
      @cards
        .zip(other.cards)
        .each do |card, other_card|
          return true if card > other_card
          return false if card < other_card
        end

      false
    end
  end

  def <(other)
    if power < other.power
      return true
    elsif power > other.power
      return false
    else # power == other.power
      @cards
        .zip(other.cards)
        .each do |card, other_card|
          return true if card < other_card
          return false if card > other_card
        end

      false
    end
  end

  def ==(other)
    return false if power != other.power

    @cards
      .zip(other.cards)
      .each do |card, other_card|
        return false if card.power != other_card.power
      end

    true
  end

  def to_s()
    @cards.map(&:label).join("") + " " + @bid.to_s
  end

  def create_cards(card_labels)
    card_labels.split("").map { |label| Day7::Card.new(label) }
  end
end
