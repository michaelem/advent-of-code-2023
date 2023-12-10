class Day3::Part1
  def run(input)
    engine_schematic = Day3::EngineSchematic.new(IO.readlines(input))
    engine_schematic.sweep.sum().to_s
  end
end
