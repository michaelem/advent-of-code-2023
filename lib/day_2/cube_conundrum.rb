class Day2::CubeConundrum
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
    game, draws = line.split(":")
    id = game[/\d+/].to_i

    draws.split(";").each { |draw| return 0 if !is_draw_possible?(draw) }

    id
  end

  def is_draw_possible?(draw)
    draw
      .split(",")
      .each do |color|
        count = color[/\d+/].to_i
        color = color[/[a-z]+/]

        case color
        when "red"
          return false if count > @red
        when "green"
          return false if count > @green
        when "blue"
          return false if count > @blue
        end
      end

    true
  end
end
