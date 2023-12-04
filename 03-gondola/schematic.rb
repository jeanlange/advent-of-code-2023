def is_symbol?(grid, row, col)
    non_symbols = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "\n"]
    in_bounds = (row > 0) && (col > 0) && (row < grid.length - 1) && (col < grid.first.length - 1)

    if in_bounds
        return !(non_symbols.include? grid[row][col])
    end
    return false
end

class SerialNumber
    attr_reader :row, :left, :right, :value

    def initialize(opts)
        @row = opts[:row]
        @left = opts[:left]
        @right = opts[:right]
        @value = opts[:value]
    end

    def is_adjacent_to?(point)
        is_within_1_row = (point.row >= @row - 1) && (point.row <= @row + 1)
        is_within_1_col = (point.col >= @left - 1) && (point.col <= @right + 1)
        # puts "within 1 row? #{is_within_1_row}, within 1 col? #{is_within_1_col}"
        return is_within_1_row && is_within_1_col
    end
end

class Gear
    attr_reader :row, :col
    attr_accessor :ratio

    def initialize(row, col)
        @row = row
        @col = col
    end
end

lines = [
    "467..114..",
    "...*......",
    "..35..633.",
    "......#...",
    "617*......",
    ".....+.58.",
    "..592.....",
    "......755.",
    "...$.*....",
    ".664.598.."
]

lines = File.readlines("input.txt")

debug = false
nums = (0..9).to_a.map(&:to_s)
horizontal_max = lines[0].length - 1
vertical_max = lines.length - 1

# here's where we'll hold all of the valid numbers
serial_numbers = []
# and gears
possible_gears = []

lines.each_with_index do |line, row|
    puts "line: #{line}" if debug
    # find all the gears
    line.chars.each_with_index do |current_char, col|
        if current_char == "*"
            possible_gears << Gear.new(row, col)
        end
    end
    
    # as long as there are still numbers in the line
    while line.match(/\d+/)
        current_num = ""
        nearby_symbol = false
        left = nil
        right = nil
        # we want to find the next number and detect if it has a symbol neighbor
        line.chars.each_with_index do |current_char, col|
            # once we've started finding a number
            if nums.include? current_char
                # keep building up the current number
                current_num << current_char
                left = col if left == nil

                # if we haven't yet found a nearby symbol for this number
                if !nearby_symbol
                    # check the 8 positions around it (plus it) for symbols
                    (-1..1).each do |i|
                        (-1..1).each do |j|
                            if is_symbol?(lines, row + i, col + j)
                                # puts "found symbol"
                                nearby_symbol = true
                            end
                        end
                    end
                end
            # we've just finished a number, let's process it!
            elsif current_num != ""
                right = col - 1
                break
            end
        end
        puts "row: #{row}, num: #{current_num}, valid: #{nearby_symbol}" if debug
        if nearby_symbol
            serial_numbers << SerialNumber.new({row: row, left: left, right: right, value: current_num.to_i})
        end

        # replace number with .s so we can find the next one
        line.sub!(current_num, "." * current_num.length)
    end
end

puts "sum of serial numbers: #{serial_numbers.map(&:value).sum}"

gears = []
possible_gears.each do |possible_gear|
    puts "gear: #{possible_gear.row}, #{possible_gear.col}" if debug
    # a gear is when a * has two (and only two) numbers adjacent
    nearby_numbers = serial_numbers.filter do |num|
        num.is_adjacent_to?(possible_gear)
    end

    if nearby_numbers.count == 2
        ratio = nearby_numbers.first.value * nearby_numbers.last.value
        possible_gear.ratio = ratio
        gears << possible_gear
    end
end

puts "sum of ratios: #{gears.sum(&:ratio)}"