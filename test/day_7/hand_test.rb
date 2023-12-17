require "test/test_helper"

class Day7::HandTest < Minitest::Test
  def test_beats_1
    hand_a = Day7::Hand.new("KK677 28")
    hand_b = Day7::Hand.new("KTJJT 220")
    assert hand_a > hand_b
  end

  def test_beats_2
    hand_a = Day7::Hand.new("QQQJA 483")
    hand_b = Day7::Hand.new("T55J5 684")

    assert hand_a > hand_b
  end

  def test_types
    five_of_a_kind = Day7::Hand.new("KKKKK 1")
    four_of_a_kind = Day7::Hand.new("KKKKA 1")
    full_house = Day7::Hand.new("KKKAA 1")
    three_of_a_kind = Day7::Hand.new("QQQJA 1")
    two_pair = Day7::Hand.new("T45T5 1")
    one_pair = Day7::Hand.new("KTJJ4 1")
    high_card = Day7::Hand.new("Q2T3K 1")

    assert_equal :five_of_a_kind, five_of_a_kind.type
    assert_equal :four_of_a_kind, four_of_a_kind.type
    assert_equal :full_house, full_house.type
    assert_equal :three_of_a_kind, three_of_a_kind.type
    assert_equal :two_pair, two_pair.type
    assert_equal :one_pair, one_pair.type
    assert_equal :high_card, high_card.type
  end
end
