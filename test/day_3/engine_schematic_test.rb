require "test/test_helper"

class Day3::EngineSchematicTest < Minitest::Test
  def test_edges
    # stree-ignore
    input = [
      "......684.491\n",
      ".........*...\n"
    ]

    assert_equal "1175", Day3::EngineSchematic.new(input).sweep.sum().to_s
  end

  def test_close_proximity
    input = [".....209*418......\n"]
    assert_equal "627", Day3::EngineSchematic.new(input).sweep.sum().to_s
  end

  def test_example_alternate
    # stree-ignore
    input = [
      "467..114.\n",
      "...*.....\n",
      "..35..633\n",
      "......#..\n",
      "617*.....\n",
      ".....+.58\n",
      "..592....\n",
      "......755\n",
      "...$.*...\n",
      ".664.598.\n"
    ]

    assert_equal "4361", Day3::EngineSchematic.new(input).sweep.sum().to_s
  end
end
