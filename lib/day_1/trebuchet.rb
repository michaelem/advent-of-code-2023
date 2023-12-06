

class Day1::Trebuchet
  def find_first_digit(line)
    numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    results = {}

    numbers.each do |number|
      index = line.index(number)
      if index
        results[number] = index
      end
    end

    result = results.min_by { |number, index| index }
    return result.first
  end

  def find_last_digit(line)
    numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    results = {}

    numbers.map do |number|
      index = line.rindex(number)
      if index
        results[number] = index
      end
    end

    result = results.max_by { |number, index| index }
    return result.first
  end

  def run(input)
    lines = IO.readlines(input).map do |line|
      (find_first_digit(line) + find_last_digit(line)).to_i
    end

    lines.sum().to_s
  end
end