require "test/test_helper"

class Day3::EngineSchematicTest < Minitest::Test
  def test_edges
    # stree-ignore
    input = [
      "......684.491\n",
      ".........*...\n"
    ]

    assert_equal "1175",
                 Day3::EngineSchematic
                   .new(input)
                   .sweep_for_part_numbers
                   .sum()
                   .to_s
  end

  def test_close_proximity
    input = [".....209*418......\n"]
    assert_equal "627",
                 Day3::EngineSchematic
                   .new(input)
                   .sweep_for_part_numbers
                   .sum()
                   .to_s
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

    schematic = Day3::EngineSchematic.new(input)

    assert_equal "4361", schematic.sweep_for_part_numbers.sum().to_s
  end

  def test_expand_number
    input = ["467..114.\n"]

    schematic = Day3::EngineSchematic.new(input)

    assert_equal "467", schematic.expand_number(0, 1).value
  end

  def test_sweep_for_gears
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

    schematic = Day3::EngineSchematic.new(input)

    assert_equal 2, schematic.sweep_for_gears.count
    assert_equal "467", schematic.sweep_for_gears[0].number_1.value
    assert_equal "35", schematic.sweep_for_gears[0].number_2.value
    assert_equal "755", schematic.sweep_for_gears[1].number_1.value
    assert_equal "598", schematic.sweep_for_gears[1].number_2.value
  end
end
