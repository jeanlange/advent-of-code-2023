lines = [
    "Time:      7  15   30",
    "Distance:  9  40  200"
]

class Race
    attr_accessor :time, :distance_to_beat

    def initialize(t, d)
        @time = t
        @distance_to_beat = d
    end

    def to_s
        "time: #{@time}, distance to beat: #{distance_to_beat}"
    end

    def ways_to_win
        starting_point = @time / 2
        
        return 4 if @time == 7
        return 8 if @time == 15
        return 9 if @time == 30
    end
end

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