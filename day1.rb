# frozen_string_literal: true

col1 = []
col2 = []

loop do
  input = gets.chomp
  break if input.downcase == 'done'

  numbers = input.split.map(&:to_i)
  col1 << numbers[0] if numbers[0]
  col2 << numbers[1] if numbers[1]
end

col1.sort!
col2.sort!

total_distance = 0

col1.each_with_index do |val1, index|
  val2 = col2[index]
  result = val1 - val2
  total_distance += result.abs
end

puts total_distance

col2_frequency = col2.tally

similarity_score = 0

col1.each do |val|
  frequency_in_col2 = col2_frequency.fetch(val, 0)
  similarity_score += (val * frequency_in_col2)
end

puts similarity_score
