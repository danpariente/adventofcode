# frozen_string_literal: true
directions = File.read("input.txt").strip.chars

MOVES = {
  "^" => [0, 1],
  "v" => [0, -1],
  ">" => [1, 0],
  "<" => [-1, 0],
}


def houses(directions)
  current_location = [0, 0]
  directions.each_with_object([]) do |direction, delivered|
    x, y = current_location
    move_x, move_y = MOVES[direction]
    delivered << current_location unless delivered.include?(current_location)
    current_location = [x + move_x, y + move_y]
  end
end

robo_santa, santa = directions.partition.with_index{|_, i| i.even? } 
team_work_houses = (houses(robo_santa) + houses(santa)).uniq

puts "Part 1: #{houses(directions).size}"
puts "Part 2: #{team_work_houses.size}"

