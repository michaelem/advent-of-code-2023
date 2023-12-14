class Day6::Race
  def initialize(time, distance)
    @time = time
    @distance = distance
  end

  def win?(distance)
    distance > @distance
  end

  def compete(charge_time)
    return 0 if charge_time > @time
    return 0 if charge_time <= 0

    speed = charge_time

    remaining_time = @time - charge_time
    speed * remaining_time
  end

  def winning_charge_times
    (1..@time).map do |charge_time|
      charge_time if win?(compete(charge_time))
    end.compact
  end
end
