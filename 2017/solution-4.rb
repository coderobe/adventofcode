#!/usr/bin/env ruby

output = File
  .readlines("input-4.txt")
  .map do |e|
    e
      .split
      .group_by(&:itself)
      .map{|k, v| [k, v.count]}
      .select{|v| v.last > 1}
      .length > 0 ? 0 : 1
  end
  .reduce(&:+)

puts output
