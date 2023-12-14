class Day6::Part2
  def run(input)
    lines = IO.readlines(input)

    time = lines[0].sub("Time:", "").strip.gsub(/\s+/, "").to_i
    distance = lines[1].sub("Distance:", "").strip.gsub(/\s+/, "").to_i
    race = Day6::Race.new(time, distance)

    race.winning_charge_times.count.to_s
  end
end
