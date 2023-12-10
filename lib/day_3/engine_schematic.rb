class Day3::EngineSchematic
  Coordinate = Struct.new(:x, :y)
  Number = Struct.new(:value, :is_part, :start, :finish)
  Symbol = Struct.new(:char, :row_index, :col_index)

  SYMBOLS = %w[- * & $ @ / # = % +]

  class Gear
    attr_accessor :gear, :number_1, :number_2

    def initialize(gear)
      @gear = gear
      @number_1 = nil
      @number_2 = nil
    end
  end

  def initialize(schematic_lines)
    @schematic = schematic_lines
  end

  def sweep_for_gears
    gears = []

    @schematic.each_with_index do |row, row_index|
      row = row.strip()

      row.each_char.with_index do |char, col_index|
        if char == "*"
          numbers = numbers_in_proximity(row_index, col_index)
          if (numbers.length == 2)
            gear = Gear.new(char)
            gear.number_1 = numbers[0]
            gear.number_2 = numbers[1]
            gears << gear
          end
        end
      end
    end

    gears
  end

  def expand_number(row_index, col_index)
    row = @schematic[row_index]

    start = col_index
    start -= 1 while row[start - 1]&.match?(/\d/)

    finish = col_index
    finish += 1 while row[finish + 1]&.match?(/\d/)

    return(
      Number.new(
        row[start..finish],
        false,
        Coordinate.new(start, row_index),
        Coordinate.new(finish, row_index)
      )
    )
  end

  def sweep_for_part_numbers
    numbers = []

    @schematic.each_with_index do |row, row_index|
      row = row.strip()
      latest_number = nil

      row.each_char.with_index do |char, col_index|
        if char.match?(/\d/)
          is_part = !symbols_in_proximity(row_index, col_index).empty?

          if latest_number == nil
            latest_number = Number.new(char, is_part)
          else
            latest_number.value += char
            latest_number.is_part = is_part || latest_number.is_part
          end
        end

        if !char.match?(/\d/) || col_index == row.length - 1
          if latest_number != nil && latest_number.is_part
            numbers << latest_number.value.to_i
          end
          latest_number = nil
        end
      end
    end
    numbers
  end

  def symbols_in_proximity(row_index, col_index)
    search_proximity(row_index, col_index, ->(char) { SYMBOLS.include?(char) })
  end

  def numbers_in_proximity(row_index, col_index)
    digits_in_proximity =
      search_proximity(row_index, col_index, ->(char) { char.match?(/\d/) })
    digits_in_proximity
      .map { |digit| expand_number(digit.row_index, digit.col_index) }
      .uniq
  end

  def search_proximity(row_index, col_index, check)
    symbols = []
    for y in [-1, 0, 1]
      for x in [-1, 0, 1]
        next if x == 0 && y == 0

        row_index_adjusted = row_index + y
        col_index_adjusted = col_index + x

        row = @schematic[row_index_adjusted]
        char = row.nil? ? nil : row[col_index_adjusted]

        next if char.nil?

        if check.call(char)
          symbols << Symbol.new(char, row_index_adjusted, col_index_adjusted)
        end
      end
    end
    symbols
  end
end
