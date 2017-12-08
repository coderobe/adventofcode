#!/usr/bin/env ruby

input = File
  .readlines("input-8.txt")
  .map(&:split)
  .each{|e| e[1] == "dec" ? e[1] = "-=" : e[1] = "+="}
  .each{|e| e[2] = e[2].to_i}
  .each{|e| e[6] = e[6].to_i}
  .map{|e| { :register => e[0], :operator => e[1], :argument => e[2], :branch_by => e[3], :comparators => [e[4], e[6]], :condition => e[5] }}

registers = input
  .map{|e| [e[:register], 0]}
  .uniq
  .to_h

input
  .each{|o| eval "registers[o[:register]] #{o[:operator]} #{o[:argument]} #{o[:branch_by]} registers[o[:comparators][0]] #{o[:condition]} #{o[:comparators][1]}"}

puts registers.sort_by{|e| e[1]}.last.last
