class Day5::Part2
  def reverse_transpose(almanac, input)
    almanac.reverse.each do |map|
      input = map.reverse_transpose(input)
    end
    input
  end

  def run(input)
    sections = File.read(input).split("\n\n")

    seeds = Day5::Seeds.new(sections[0])

    almanac = sections[1..-1].map do |section|
      Day5::Map.new(section)
    end

    location = 0

    while !seeds.in_range?(reverse_transpose(almanac, location))
      location += 1
    end

    location.to_s
  end
end