def is_symbol?(grid, row, col)
    non_symbols = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "\n"]
    in_bounds = (row > 0) && (col > 0) && (row < grid.length - 1) && (col < grid.first.length - 1)

    if in_bounds
        return !(non_symbols.include? grid[row][col])
    end
    return false
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
sum = 0
horizontal_max = lines[0].length - 1
vertical_max = lines.length - 1

lines.each_with_index do |line, row|
    puts "line: #{line}" if debug
    # as long as there are still numbers in the line
    while line.match(/\d+/)
        current_num = ""
        nearby_symbol = false
        # we want to find the next number and detect if it has a symbol neighbor
        line.chars.each_with_index do |current_char, col|
            # once we've started finding a number
            if nums.include? current_char
                # keep building up the current number
                current_num << current_char

                # if we haven't yet found a nearby symbol for this number
                if !nearby_symbol
                    # check the 8 positions around it (plus it) for symbols
                    (-1..1).each do |i|
                        (-1..1).each do |j|
                            if is_symbol?(lines, row + i, col + j)
                                nearby_symbol = true
                            end
                        end
                    end
                end
            # we've just finished a number, let's process it!
            elsif current_num != ""
                break
            end
        end
        puts "row: #{row}, num: #{current_num}, valid: #{nearby_symbol}" if debug
        if nearby_symbol
            sum += current_num.to_i
        end

        # replace number with .s so we can find the next one
        line.sub!(current_num, "." * current_num.length)
    end
end

puts sum