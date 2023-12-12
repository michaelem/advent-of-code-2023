require "test/test_helper"

class Day4::ScratchcardTest < Minitest::Test
  def test_parse_card_a
    card = Day4::Scratchcard.new("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53")
    assert_equal "Card 1", card.name
    assert_equal 1, card.id
    assert_equal ["41", "48", "83", "86", "17"], card.numbers
    assert_equal ["83", "86", "6", "31", "17", "9", "48", "53"], card.winning_numbers
    assert_equal 4, card.matches
    assert_equal 8, card.score
  end

  def test_parse_card_b
    card = Day4::Scratchcard.new("Card 176:  3 87 49 74 88 50 90  2 10 11 | 68 34 89 67  1  9 64  8 21 27 96 84 48 37 69 28 18 12 97 16 40 93  5 41 77")

    assert_equal "Card 176", card.name
    assert_equal 176, card.id
    assert_equal ["3", "87", "49", "74", "88", "50", "90", "2", "10", "11"], card.numbers
    assert_equal ["68", "34", "89", "67", "1", "9", "64", "8", "21", "27", "96", "84", "48", "37", "69", "28", "18", "12", "97", "16", "40", "93", "5", "41", "77"], card.winning_numbers
    assert_equal 0, card.matches
    assert_equal 0, card.score
  end
end
