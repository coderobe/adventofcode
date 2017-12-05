#!/usr/bin/env ruby

output = File
  .readlines("input-2.txt")
  .map{|e| e.split.map(&:to_f)}
  .map{|e| e.each_with_index.map{|v, i| e.each_with_index.map{|v2, t| (t != i) ? v/v2 : 0}}.flatten.select{|v| v % 1 == 0}.reduce(&:+).to_i}
  .reduce(&:+)

puts output
