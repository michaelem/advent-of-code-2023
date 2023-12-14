class Day5::Seeds
  attr_reader :seeds

  def initialize(input)
    @ranges = input.sub('seeds: ', '').split(' ').map(&:to_i)
  end

  def in_range?(number)
    for range in @ranges.each_slice(2)
      return true if number >= range[0] && number < range[0] + range[1]
    end
    return false
  end
end