#!/usr/bin/env ruby

input = File
  .readlines("input-7.txt")
  .map{|e| e.gsub(/[\(\),\->]/, "").split}
  .map{|e| {:name => e.first, :weight => e[1], :childs => e[2..-1], :parent => nil}}

output = input
  .each{|e| e[:parent] = input.select{|v| v[:childs].include? e[:name]}.first}
  .each{|e| e[:parent] = e[:parent][:name] rescue ""}
  .select{|e| e[:parent] == ""}.first[:name]

puts output
