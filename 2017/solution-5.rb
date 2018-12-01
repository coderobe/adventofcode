#!/usr/bin/env ruby

input = File
  .readlines("input-5.txt")
  .map(&:to_i)

i, output = 0, 0

while i < input.length && i >= 0 do
  step = input[i]
  input[i] += 1
  i += step 
  output += 1
end

puts output
