#!/usr/bin/env ruby

puts File.readlines("input-1.txt").map(&:to_i).reduce(&:+)
