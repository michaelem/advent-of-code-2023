class Day3::EngineSchematic
  Number = Struct.new(:value, :is_part)
  SYMBOLS = %w[- * & $ @ / # = % +]

  def initialize(schematic_lines)
    @schematic = schematic_lines
  end

  def sweep
    numbers = []

    @schematic.each_with_index do |row, row_index|
      row = row.strip()
      latest_number = nil

      row.each_char.with_index do |char, col_index|
        if char.match?(/\d/)
          is_part = symbol_in_proximity?(row_index, col_index)

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

  private

  def symbol_in_proximity?(row_index, col_index)
    for y in [-1, 0, 1]
      for x in [-1, 0, 1]
        next if x == 0 && y == 0

        row = @schematic[row_index + y]
        char = row.nil? ? nil : row[col_index + x]

        next if char.nil?

        return true if SYMBOLS.include?(char)
      end
    end
    false
  end
end
