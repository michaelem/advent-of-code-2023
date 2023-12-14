class Day5::Part1
  def run(input)
    sections = File.read(input).split("\n\n")

    seeds = sections[0].sub("seeds: ", "").split(" ").map(&:to_i)

    almanac = sections[1..-1].map { |section| Day5::Map.new(section) }

    locations =
      seeds.map do |seed|
        almanac.each { |map| seed = map.transpose(seed) }
        seed
      end

    locations.min.to_s
  end
end
