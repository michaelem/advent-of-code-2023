VALUES = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
  "1" => "1",
  "2" => "2",
  "3" => "3",
  "4" => "4",
  "5" => "5",
  "6" => "6",
  "7" => "7",
  "8" => "8",
  "9" => "9"
}

class Day1::Trebuchet
  def find_first_digit(line)
    results = {}

    VALUES.keys.each do |number|
      index = line.index(number)
      results[number] = index if index
    end

    result = results.min_by { |number, index| index }
    return VALUES[result.first]
  end

  def find_last_digit(line)
    results = {}

    VALUES.keys.map do |number|
      index = line.rindex(number)
      results[number] = index if index
    end

    result = results.max_by { |number, index| index }
    return VALUES[result.first]
  end

  def run(input)
    lines =
      IO
        .readlines(input)
        .map { |line| (find_first_digit(line) + find_last_digit(line)).to_i }

    lines.sum().to_s
  end
end
