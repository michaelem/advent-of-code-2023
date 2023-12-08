class Day2::CubeConundrumPart2
  def run(input)
    lines = IO.readlines(input).map { |line| process_line(line) }
    lines.sum().to_s
  end

  def process_line(line)
    game = Day2::Game.new(line)

    game.max_green * game.max_red * game.max_blue
  end
end
