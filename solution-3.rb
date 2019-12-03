#!/usr/bin/env ruby

input = File.readlines("input-3.txt").map{|wire|
  wire = wire.chomp.split(',')
    .map{|p| p.split(/(.)(.+)/)[1..]}
    .map{|p| [p.first.to_sym, p.last.to_i]} # from "U10" to [:U, 10]
  pos = [0, 0]
  wire = [pos.clone] + wire.map{|move|
    case move.first
    when :U
      ax = 0
      pn = :-
    when :D
      ax = 0
      pn = :+
    when :L
      ax = 1
      pn = :-
    when :R
      ax = 1
      pn = :+
    end
    pos[ax] = pos[ax].send(pn, move.last)
    pos.clone
  } # from [:U, 10] to [-10, 0] (relative to absolute pos)
  wire.map.with_index{|pos, i|
    ipol = [wire[[i-1, 0].max]]
    ipol << [ipol.last.first, ipol.last.last+1] while ipol.last.last < pos.last
    ipol << [ipol.last.first+1, ipol.last.last] while ipol.last.first < pos.first
    ipol << [ipol.last.first, ipol.last.last-1] while ipol.last.last > pos.last
    ipol << [ipol.last.first-1, ipol.last.last] while ipol.last.first > pos.first
    ipol
  }.flatten.each_slice(2).to_a # interpolate missing positions
}.reduce(&:&) # only intersections

input.shift # remove leading [0, 0]

class Array
  def manhattan_from_0
    self[0].abs + self[1].abs
  end
end

p "part 1", input.map(&:manhattan_from_0).min
