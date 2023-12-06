require './lib/almanac.rb'

lines = [
    "seeds: 79 14 55 13",
    "",
    "seed-to-soil map:",
    "50 98 2",
    "52 50 48",
    "",
    "soil-to-fertilizer map:",
    "0 15 37",
    "37 52 2",
    "39 0 15",
    "",
    "fertilizer-to-water map:",
    "49 53 8",
    "0 11 42",
    "42 0 7",
    "57 7 4",
    "",
    "water-to-light map:",
    "88 18 7",
    "18 25 70",
    "",
    "light-to-temperature map:",
    "45 77 23",
    "81 45 19",
    "68 64 13",
    "",
    "temperature-to-humidity map:",
    "0 69 1",
    "1 0 69",
    "",
    "humidity-to-location map:",
    "60 56 37",
    "56 93 4"
]

lines = File.open("input.txt").readlines

debug = false
mappers = []
seeds = []
mapper = AlmanacMapper.new

# read each input into an Almanac Mapper and store it in the list
lines.each do |line|
    if line.match(/seeds:/)
        seeds = line.split(":").last.split.map(&:to_i)
        puts "Seeds: #{seeds}" if debug
    elsif line.match(/map:/)
        mapper = AlmanacMapper.new
        mapper.parse_title(line)
    elsif line == "\n"
        if mapper.ranges.length > 0
            mappers << mapper
        end
    else
        mapper.add_range(line)
    end
end
mappers << mapper

puts mappers if debug

distances = {}

# follow each seed through all the mappers to find the locations
seeds.each do |seed|
    input = seed
    mappers.each do |mapper|
        output = mapper.map(input)
        puts "#{mapper.title}: #{input} => #{output}" if debug
        input = output
    end
    distances[seed.to_s] = input
    puts if debug
end

puts distances if debug

# find the smallest distance and report it
puts distances.values.min