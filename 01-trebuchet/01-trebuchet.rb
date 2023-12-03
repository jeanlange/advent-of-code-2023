lines = ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]




nums = (0..9).to_a.map{|one| one.to_s}

sum = 0

File.open('01-input.txt').each do |line|
    first = line.match(/\d/) # first digit
    last  = line.reverse.match(/\d/) # last digit

    num = (first.to_s + last.to_s).to_i
    puts num
    sum += num
end

puts sum