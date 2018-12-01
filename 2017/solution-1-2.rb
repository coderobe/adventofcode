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
    want = i + input.length / 2
    new = want
    new = want - input.length while new >= input.length
    (input[i] == input[new]) ? v : 0
  end
  .reduce(&:+)

puts output
