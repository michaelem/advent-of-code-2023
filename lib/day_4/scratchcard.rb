class Day4::Scratchcard
  def initialize(card_string)
    @name = get_name(card_string)
    @id = get_id(@name)
    @numbers = get_numbers(card_string)
    @winning_numbers = get_winning_numbers(card_string)
    @matches = number_of_matches
  end

  attr_reader :name, :id, :numbers, :winning_numbers, :matches

  def score
    if @matches <= 0
      0
    else
      2**(@matches - 1)
    end
  end

  private

  def get_name(card_string)
    card_string.split(": ")[0]
  end

  def get_id(name)
    name.match(/Card\s+(\d+)/)[1].to_i
  end

  def number_of_matches
    @numbers.count { |number| @winning_numbers.include?(number) }
  end

  def get_winning_numbers(card_string)
    card_string.split(/\s+\|\s+/)[1].split(/\s+/)
  end

  def get_numbers(card_string)
    first_part = card_string.split("|")[0]
    first_part.split(/\:\s+/)[1].split(/\s+/)
  end
end
