class Day4::Scratchcard
  def initialize(card_string)
    @name = get_name(card_string)
    @numbers = get_numbers(card_string)
    @winning_numbers = get_winning_numbers(card_string)
  end

  attr_reader :name, :numbers, :winning_numbers

  def calculate_score
    score = 0
    @numbers.each do |number|
      if @winning_numbers.include?(number)
        if score == 0
          score = 1
        else
          score = score * 2
        end
      end
    end
    score
  end

  private
  def get_name(card_string)
    card_string.split(": ")[0]
  end

  def get_winning_numbers(card_string)
    card_string.split(/\s+\|\s+/)[1].split(/\s+/)
  end

  def get_numbers(card_string)
    first_part = card_string.split("|")[0]
    first_part.split(/\:\s+/)[1].split(/\s+/)
  end
end
