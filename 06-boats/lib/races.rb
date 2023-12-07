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
        mid_point = @time / 2
        # puts "mid: #{mid_point}"
        first_good = 0
        (1..mid_point).each do |try|
            # puts "trying #{try}"
            result = (@time - try) * try
            if result > @distance_to_beat
                first_good = try
                break
            end
        end
        # puts "first good: #{first_good}"

        if @time.odd?
            wins = 2 * (mid_point - first_good + 1)
        else
            wins = 2 * (mid_point - first_good) + 1
        end

        return wins
    end
end