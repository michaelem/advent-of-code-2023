require "test/test_helper"

class Day2::GameTest < Minitest::Test
  def setup
    @game =
      Day2::Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
  end

  def test_game
    assert_equal 1, @game.id
    assert_equal 3, @game.draws[0].blue
    assert_equal 4, @game.draws[0].red
    assert_equal 1, @game.draws[1].red
    assert_equal 2, @game.draws[1].green
    assert_equal 6, @game.draws[1].blue
    assert_equal 2, @game.draws[2].green
  end

  def test_maxima
    assert_equal 6, @game.max_blue
    assert_equal 4, @game.max_red
    assert_equal 2, @game.max_green
  end
end
