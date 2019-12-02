#!/usr/bin/env ruby

puts File.readlines("input-3.txt")
	.map{|e| e.scan(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/).first.map(&:to_i)}
	.map{|e| e[3].times.map{|x| e[4].times.map{|y| [e[0], x+e[1], y+e[2], e[3]*e[4]]}}}
	.flatten(2)
	.sort_by{|a| [a[1], a[2]]}
	.chunk{|c| [c[1], c[2]]}
	.map(&:last)
	.reject{|c| c.size > 1}
	.flatten(1)
	.group_by(&:first)
	.map{|e| [e[0], e[1][0][3] == e[1].size]}
	.select(&:last)
	.map(&:first)
