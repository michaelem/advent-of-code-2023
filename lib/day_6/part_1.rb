class Day6::Part1
  def run(input)
    lines = IO.readlines(input)

    times = lines[0].sub("Time:", "").strip.split(/\s+/).map(&:to_i)
    distances = lines[1].sub("Distance:", "").strip.split(/\s+/).map(&:to_i)
    races = times.zip(distances).map { |race| Day6::Race.new(race[0], race[1]) }

    races.map { |race| race.winning_charge_times.count }.inject(:*).to_s
  end
end
