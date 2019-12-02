#!/usr/bin/env ruby

p "part 1", File.readlines("input-1.txt").map{|m| (m.chomp.to_i/3).floor-2}.reduce(&:+)

p "part 2"
def fuel_fuel(fuel, needed = 0)
  loop do
    old = needed
    fuel = [(fuel/3).floor-2,0].max
    needed += fuel
    break if needed == old
  end
  needed
end
p File.readlines("input-1.txt").map{|m| fuel_fuel(m.chomp.to_i)}.reduce(&:+)
