class Day5::Map
  def initialize(input)
    lines = input.split("\n")
    @name = lines[0].sub("map:", "").strip
    @ranges = parse_map(lines[1..-1])
  end

  attr_reader :name, :ranges

  def transpose(number)
    @ranges.each do |range|
      if number >= range[:source_range_start] && number <= range[:source_range_start] + range[:range_length]
        return range[:destination_range_start] + (number - range[:source_range_start])
      end
    end
    number
  end

  private
  def parse_map(lines)
    lines.map do |line|
      ranges = line.split(" ").map(&:to_i)
      { 
        destination_range_start: ranges[0],
        source_range_start: ranges[1],
        range_length: ranges[2]
      }
    end
  end
end