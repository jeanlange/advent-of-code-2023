lines = [
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
    "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
    "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
    "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
    "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
]

elf_red = 12
elf_blue = 14
elf_green = 13

sum = 0
power_sum = 0

# lines.each do |line|
File.open("input.txt").each do |line|
    # find the max blue, r, g shown in each game
    blues = line.scan(/(\d+) blue/).flatten.map{|num| num.to_i}
    reds = line.scan(/(\d+) red/).flatten.map{|num| num.to_i}
    greens = line.scan(/(\d+) green/).flatten.map{|num| num.to_i}
    
    blue_max = blues.max
    red_max = reds.max
    green_max = greens.max

    # determine whether it's possible - max <= total
    if (blue_max <= elf_blue) && (green_max <= elf_green) && (red_max <= elf_red)
        # if possible, add id to sum 
        sum += line.match(/Game (\d+)/)[1].to_i
    end

    # find 'power' of game - max number of each color multiplied
    power = blue_max * green_max * red_max
    if (blue_max == 0) || (green_max == 0) || (red_max == 0)
        puts "oh no, 0 max"
        puts "game: #{line}"
        puts "power for this game: #{power}"
    end
    power_sum += power
end

puts "sum: #{sum}"
puts "power sum: #{power_sum}"