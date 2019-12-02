#!/usr/bin/env ruby

input = File.read("input-2.txt").split(',').map(&:to_i)

def int(state, noun, verb)
  state[1] = noun
  state[2] = verb
  pc, instr = 0
  while instr != 99 do
    instr = state[pc]
    res = nil
    begin
      case instr
      when 1
        res = state[state[pc+=1]] + state[state[pc+=1]]
      when 2
        res = state[state[pc+=1]] * state[state[pc+=1]]
      when 99
        break
      end
      raise if res.nil?
      state[state[pc+=1]] = res
    rescue
      state[0] = nil
      break
    end
    pc+=1
  end
  state[0]
end

p "part 1", int(input.clone, 12, 2)

target = 19690720
pool = (0..99).to_a
noun, verb = 0
loop do
  break if int(input.clone, noun, verb) == target
  noun, verb = pool.sample, pool.sample
end
p "part 2", 100 * noun + verb
