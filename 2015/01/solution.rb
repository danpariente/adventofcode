# frozen_string_literal: true

class Building
  ACTIONS = { 
    UP = "(" => 1,
    DOWN = ")" => -1,
  }.freeze

  def floor
    instructions.count(UP) - instructions.count(DOWN)
  end

  def position(floor, sum = 0)
    instructions.chars.each.with_index do |a, idx|
      sum += ACTIONS[a]
      return idx + 1 if sum == floor
    end
  end

  private

  def instructions
    File.read("input.txt")
  end
end

p Building.new.floor
p Building.new.position(-1)
