class Day5::Seeds
  attr_reader :seeds

  def initialize(input)
    @seeds = input.sub('seeds: ', '').split(' ').map(&:to_i)
  end
end