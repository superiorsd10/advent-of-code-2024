# frozen_string_literal: true

def is_valid_sequence?(arr)
  increasing = decreasing = true

  (arr.length - 1).times do |i|
    diff = (arr[i + 1] - arr[i]).abs
    if diff < 1 || diff > 3
      return false
    end
    increasing &&= arr[i + 1] > arr[i]
    decreasing &&= arr[i + 1] < arr[i]
  end

  increasing || decreasing
end

def valid_with_one_removal?(arr)
  return true if is_valid_sequence?(arr)

  (0...arr.length).each do |i|
    new_arr = arr[0...i] + arr[i + 1..]
    return true if is_valid_sequence?(new_arr)
  end

  false
end

arrays = []

loop do
  input = gets.chomp
  break if input.downcase == 'done'

  arrays << input.split.map(&:to_i)
end

# PART 1

valid_sequences = arrays.count { |arr| is_valid_sequence?(arr) }

puts valid_sequences

# PART 2

valid_sequences = arrays.count { |arr| valid_with_one_removal?(arr) }

puts valid_sequences
