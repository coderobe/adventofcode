#!/usr/bin/env ruby

puts File.readlines("input-3.txt")
	.map{|e| e.scan(/#\d+ @ (\d+),(\d+): (\d+)x(\d+)/).first.map(&:to_i)}
	.map{|e| e[2].times.map{|x| e[3].times.map{|y| [x+e[0], y+e[1]]}}}
	.flatten(2)
	.sort
	.chunk{|e| e}
	.select{|c| c.last.size > 1}
	.size
