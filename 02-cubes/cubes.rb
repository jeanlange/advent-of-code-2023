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
# lines.each do |line|
File.open("input.txt").each do |line|
    # find the max blue, r, g shown in each game
    blue_max = line.scan(/(\d+) blue/).flatten.map{|num| num.to_i}.max
    red_max = line.scan(/(\d+) red/).flatten.map{|num| num.to_i}.max
    green_max = line.scan(/(\d+) green/).flatten.map{|num| num.to_i}.max
    # determine whether it's possible - max <= total
    if (blue_max <= elf_blue) && (green_max <= elf_green) && (red_max <= elf_red)
        # if possible, add id to sum 
        sum += line.match(/Game (\d+)/)[1].to_i
    end
end

puts sum