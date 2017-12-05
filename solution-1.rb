#!/usr/bin/env ruby

input = File
  .readlines("input-1.txt")
  .first
  .chomp
  .split("")
  .map(&:to_i)

output = input
  .each_with_index
  .map do |v, i|
    (v == input[i+1] || i+1 >= input.length && v == input.first) ? v : 0
  end
  .reduce(&:+)

puts output
