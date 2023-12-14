class Day5::Part2
  def reverse_transpose(almanac, input)
    almanac.reverse.each { |map| input = map.reverse_transpose(input) }
    input
  end

  def run(input)
    sections = File.read(input).split("\n\n")

    seeds = Day5::Seeds.new(sections[0])

    almanac = sections[1..-1].map { |section| Day5::Map.new(section) }

    location = 0

    location += 1 while !seeds.in_range?(reverse_transpose(almanac, location))

    location.to_s
  end
end
