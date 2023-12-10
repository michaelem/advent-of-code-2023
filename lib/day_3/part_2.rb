class Day3::Part2
  def run(input)
    engine_schematic = Day3::EngineSchematic.new(IO.readlines(input))
    gear_ratios = engine_schematic.sweep_for_gears.map do |gear|
      gear.number_1.value.to_i * gear.number_2.value.to_i
    end
    gear_ratios.sum().to_s
  end
end
