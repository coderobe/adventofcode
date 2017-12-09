#!/usr/bin/env ruby

input = File
  .readlines("input-9.txt")
  .first
  .gsub(/!./, "")
  .gsub(/<[^>]*>/, "")
  .gsub(/\,/, "")

group, output = "{}", 0

while input.include? group do
  output += input.split(group.chars.last).first.chars.count
  input.slice!(group)
end

puts output
