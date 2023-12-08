class Day2::CubeConundrumPart1
  def initialize(red: 12, green: 13, blue: 14)
    @red = red
    @green = green
    @blue = blue
  end

  def run(input)
    lines = IO.readlines(input).map { |line| process_line(line) }
    lines.sum().to_s
  end

  private

  def process_line(line)
    game = Day2::Game.new(line)
    game.draws.each { |draw| return 0 if !is_draw_possible?(draw) }
    return game.id
  end

  def is_draw_possible?(draw)
    draw.red <= @red && draw.green <= @green && draw.blue <= @blue
  end
end
