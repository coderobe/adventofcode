#!/usr/bin/env ruby

output = File
  .readlines("input-2.txt")
  .map(&:split)
  .map{|e| e.map(&:to_i)}
  .map(&:sort)
  .map{|e| e.last - e.first}
  .reduce(&:+)

puts output
