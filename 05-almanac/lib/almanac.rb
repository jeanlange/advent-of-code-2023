class AlmanacMapper
    attr_reader :title, :input, :output, :ranges

    def initialize
        @ranges = []
    end

    def parse_title (text)
        parts = text.split("-")
        @input = parts[0]
        @output = parts[2].sub(/ .*/, "")
        @title = "#{@input} to #{@output}"
    end

    def add_range text
        @ranges << AlmanacRange.new(text)
    end
end

class AlmanacRange
    attr_reader :original_text, :source_start, :source_end, :offset

    def initialize text
        @original_text = text
        parts = text.split
        @source_start = parts[0].to_i
        width = parts[2].to_i
        @source_end = @source_start + width - 1
        destination_start = parts[1].to_i
        @offset = destination_start - @source_start
    end

    def translate input
        if in_range? input
            return input + @offset
        end
        return input
    end

    def in_range? input
        input >= @source_start && input <= @source_end
    end
end