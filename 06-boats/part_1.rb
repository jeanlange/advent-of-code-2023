require "./lib/races"
lines = [
    "Time:      7  15   30",
    "Distance:  9  40  200"
]

better_lines = []
lines.each do |line|
    better_lines << line.split(":").last.split.map(&:to_i)
end
races = []
(0...better_lines.first.length).each do |x|
    races << Race.new(better_lines[0][x], better_lines[1][x])
end

ways_to_win = 1
races.each do |race|
    ways_to_win = race.ways_to_win * ways_to_win
end
puts ways_to_win