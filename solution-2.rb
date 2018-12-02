#!/usr/bin/env ruby

puts File.readlines("input-2.txt")
	.map(&:chomp)
	.map(&:chars)
	.map{|e| e.sort.chunk{|e| e}.map{|c| c.last.size}.uniq}
	.flatten
	.select{|e| e==2 || e==3}
	.sort
	.chunk{|c| c}
	.reduce{|e1,e2| e1.last.size*e2.last.size}
