#!/usr/bin/env ruby

puts File.readlines("input-3.txt")
	.map{|e| e.scan(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/).first.map(&:to_i)}
	.map{|e| e[3].times.map{|x| e[4].times.map{|y| [e[0], x+e[1], y+e[2], e[3]*e[4]]}}}
	.flatten(2)
	.sort_by{|a| [a[1], a[2]]}
	.chunk{|c| [c[1], c[2]]}
	.reject{|c| c.last.size > 1}
	.map(&:last)
	.flatten(1)
	.map{|e| [e[0], e[3]]}
	.sort_by(&:first)
	.chunk(&:first)
	.map{|e| [e[0], e.last.last.last, e[1].size]}
	.select{|e| e[1] == e[2]}
	.map(&:first)
