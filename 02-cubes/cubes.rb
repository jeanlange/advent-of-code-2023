
class Game
    attr_reader :red, :green, :blue, :id

    def initialize(text)
        @id = text.match(/Game (\d+):/)[1].to_i
        @text = text

        @red = color_max("red")
        @green = color_max("green")
        @blue = color_max("blue")
    end

    def color_max(color)
        @text.scan(/(\d+) #{color}/).flatten.map(&:to_i).max
    end

    def power
        @red * @blue * @green
    end

    def possible?(elf)
        (@red <= elf[:red]) && (@green <= elf[:green]) && (@blue <= elf[:blue])
    end
end
lines = [
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
    "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
    "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
    "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
    "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
]

sum = 0
power_sum = 0

# lines.each do |line|
File.open("input.txt").each do |line|
    game = Game.new(line)

    elf_dice = {red: 12, green: 13, blue: 14}
    if game.possible?(elf_dice)
        sum += game.id
    end

    power_sum += game.power
end

puts "sum: #{sum}"
puts "power sum: #{power_sum}"