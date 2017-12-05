#!/usr/bin/env ruby

output = File
  .readlines("input-2.txt")
  .map{|e| e.split.map(&:to_i)}
  .map{|e| e.each_with_index.map{|v, i| e.each_with_index.map{|v2, t| (t != i) ? v.to_f/v2 : 0}}.flatten.select{|v| v % 1 == 0}.reduce(&:+).to_i}
  .reduce(&:+)

puts output
