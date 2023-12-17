class Day7::Card
  LABELS = %w[2 3 4 5 6 7 8 9 T J Q K A]

  def initialize(label)
    unless LABELS.include?(label)
      raise ArgumentError, "Invalid card label: #{label}"
    end
    @label = label
    @power = LABELS.index(label)
  end

  def >(other)
    @power > other.power
  end

  def ==(other)
    @power == other.power
  end

  def >=(other)
    @power >= other.power
  end

  def <=(other)
    @power <= other.power
  end

  def <(other)
    @power < other.power
  end

  attr_reader :label, :power
end
