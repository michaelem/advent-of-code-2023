class Day3::Part1
  def run(input)
    engine_schematic = Day3::EngineSchematic.new(IO.readlines(input))
    engine_schematic.sweep_for_part_numbers.sum().to_s
  end
end
