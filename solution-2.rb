#!/usr/bin/env ruby

output = File
  .readlines("input-2.txt")
  .map{|e| e.split.map(&:to_i).sort}
  .map{|e| e.last - e.first}
  .reduce(&:+)

puts output
