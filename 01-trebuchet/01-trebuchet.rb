lines = ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]
pt2_lines = ["two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2", "zoneight234", "7pqrstsixteen"]




nums = (0..9).to_a.map{|one| one.to_s}

sum = 0


File.open('01-input.txt').each do |line|
# pt2_lines.each do |line|
    line = line.gsub("one", "o1e").gsub("two", "t2o").gsub("three", "t3e").gsub("four", "f4r").gsub("five", "f5e").gsub("six", "s6x").gsub("seven", "s7n").gsub("eight", "e8t").gsub("nine", "n9e")
    first = line.match(/\d/) # first digit
    last  = line.reverse.match(/\d/) # last digit

    num = (first.to_s + last.to_s).to_i
    sum += num
end

puts sum