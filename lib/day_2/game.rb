class Day2::Game
  Draw = Struct.new(:green, :red, :blue)

  attr_reader :id, :draws

  def initialize(game_string)
    @id, @draws = process(game_string)
  end

  def max_green
    @draws.map(&:green).max
  end

  def max_red
    @draws.map(&:red).max
  end

  def max_blue
    @draws.map(&:blue).max
  end

  private

  def process(game_string)
    id_string, draw_strings = game_string.split(":")
    id = id_string[/\d+/].to_i
    draws =
      draw_strings
        .split(";")
        .map do |draw_string|
          Draw
            .new(0, 0, 0)
            .tap do |draw|
              draw_string
                .split(",")
                .each do |color_string|
                  count = color_string[/\d+/].to_i
                  color = color_string[/[a-z]+/]

                  draw[color] = count
                end
            end
        end
    return id, draws
  end
end
