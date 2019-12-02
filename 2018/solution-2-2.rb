#!/usr/bin/env ruby

def ld(s, t)
  v0 = (0..t.length).to_a
  v1 = []
  s.chars.each_with_index do |s_ch, i|
    v1[0] = i + 1
    t.chars.each_with_index do |t_ch, j|
      cost = s_ch == t_ch ? 0 : 1
      v1[j + 1] = [v1[j] + 1, v0[j + 1] + 1, v0[j] + cost].min
    end
    v0 = v1.dup
  end
  v0[t.length]
end

input = File.readlines("input-2.txt").map(&:chomp)

puts input.map{|e| input.map{|i| ld(e,i)}}
	.map
	.with_index{|e,i| [i,e.map.with_index{|s,si| s==1 ? si : nil}.reject(&:nil?)]}
	.select{|v| v.last.size>0}
	.map(&:flatten)
	.map(&:sort)
	.map(&:uniq)
	.chunk{|c| c}
	.map(&:first)
	.map{|e| e.map{|i| input[i].chars}}
	.map{|e| [e[0].dup.reject.with_index{|c,i| e[1][i] != c}, e[1].reject.with_index{|c,i| e[0][i] != c}]}
	.map{|e| e.map{|i| i.join("")}.reduce{|e1, e2| e1 == e2 ? e1 : nil}}
	.reject(&:nil?)
	.first
