require "test/test_helper"

class Day5::MapTest < Minitest::Test
  def test_ranges
    input = <<~INPUT
      seed-to-soil map:
      50 98 2
      52 50 48
    INPUT
    
    map = Day5::Map.new(input)

    assert_equal 2, map.ranges.length

    assert_equal 50, map.ranges[0][:destination_range_start]
    assert_equal 98, map.ranges[0][:source_range_start]
    assert_equal 2, map.ranges[0][:range_length]

    assert_equal 52, map.ranges[1][:destination_range_start]
    assert_equal 50, map.ranges[1][:source_range_start]
    assert_equal 48, map.ranges[1][:range_length]
  end

  def test_transposition
    input = <<~INPUT
      seed-to-soil map:
      50 98 2
      52 50 48
    INPUT
    
    map = Day5::Map.new(input)
    assert_equal 81, map.transpose(79)
    assert_equal 14, map.transpose(14)
    assert_equal 57, map.transpose(55)
    assert_equal 13, map.transpose(13)
  end
end