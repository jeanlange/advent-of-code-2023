class Card
    attr_reader :id, :winning_numbers, :card_numbers, :winners
    def initialize(text)
        @id = text.match(/Card +(\d+)/)[1].to_s
        @winning_numbers = text.split(/[:|]/)[1].split
        @card_numbers = text.split(/[:|]/)[2].split
        @winners = @winning_numbers.intersection(@card_numbers)
    end

    def score
        if @winners.empty?
            return 0
        else
            return 2**(@winners.length-1)
        end
    end
end

