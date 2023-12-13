class Day5::Part1
  def run(input)
    sections = File.read(input).split("\n\n")

    seeds = Day5::Seeds.new(sections[0]).seeds

    almanac = sections[1..-1].map do |section|
      Day5::Map.new(section)
    end

    locations = seeds.map do |seed|
      almanac.each do |map|
        seed = map.transpose(seed)
      end
      seed
    end

    locations.min.to_s
  end
end