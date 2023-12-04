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
not_symbols = []
not_symbols << nums
not_symbols << "." << "\n"
not_symbols.flatten!
sum = 0
horizontal_max = lines[0].length - 1
vertical_max = lines.length - 1

lines.each_with_index do |line, row|
    puts "line: #{line}" if debug
    while line.match(/\d+/)
        current_num = ""
        nearby_symbol = false
        line.chars.each_with_index do |letter, col|
            if nums.include? letter
                current_num << letter
                puts "row: #{row}, col: #{col}, symbol: #{letter}" if debug
                # if we haven't yet found a nearby symbol for this number
                if !nearby_symbol
                    # check the 8 positions around it
                    # top left
                    if (row > 0) && (col > 0)
                        puts "checking up left" if debug
                        if !(not_symbols.include? lines[row - 1][col - 1])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # above
                    if row > 0
                        puts "checking up" if debug
                        if !(not_symbols.include? lines[row - 1][col])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # up right
                    if (row > 0) && (col < horizontal_max)
                        puts "checking up right" if debug
                        if !(not_symbols.include? lines[row - 1][col + 1])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # left
                    if (col > 0)
                        puts "checking left" if debug
                        if !(not_symbols.include? lines[row][col - 1])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # right
                    if (col < horizontal_max)
                        puts "checking right" if debug
                        if !(not_symbols.include? lines[row][col + 1])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # bottom left
                    if (row < vertical_max) && (col > 0)
                        puts "checking bottom left" if debug
                        if !(not_symbols.include? lines[row + 1][col - 1])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # bottom
                    if (row < vertical_max)
                        puts "checking bottom" if debug
                        if !(not_symbols.include? lines[row + 1][col])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                    # bottom right
                    if (row < vertical_max) && (col < horizontal_max)
                        puts "checking bottom right" if debug
                        if !(not_symbols.include? lines[row + 1][col + 1])
                            nearby_symbol = true
                            puts "found" if debug
                            next
                        end
                    end
                end
            elsif current_num != ""
                break
            end
        end
        puts current_num if debug
        puts "row: #{row}, num: #{current_num}, valid: #{nearby_symbol}"
        if nearby_symbol
            sum += current_num.to_i
        end

        # replace number with .s
        line.sub!(current_num, "." * current_num.length)
    end
end

puts sum

# read whole thing into memory
# for each line? nope - have to look at line above/below, too. Line with index
# while I find a digit pattern? find the numbers
# find out if the numbers are adjacent to a symbol
    # look at 3 lines
    # grid location of each digit, look in all 8 directions for anything not a number or period?
    # stop looking once you've found it
# if so, add them to a sum