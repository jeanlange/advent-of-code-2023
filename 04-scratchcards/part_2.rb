def add_card(hash, id)
    current_value = hash[id]
    if current_value
        hash[id] = current_value + 1
    else
        hash[id] = 1
    end
end

require './lib/scratchcards'

lines = [
    "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
    "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
    "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
    "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
    "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
    "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
]

# build something like this
# total_cards = {
#     "1" => 1,
#     "2" => 3
# }
# and then sum up the values at the end

total_cards = {}

lines = File.open("input.txt").readlines

lines.each do |line|
    card = Card.new(line)

    # add the current card to the hash
    add_card(total_cards, card.id)
    # puts "card #{card.id} has #{card.winners.length} winners"

    # for each copy of the current card
    total_cards[card.id].times do
        id_to_add = 1
        # add one of each of the next WINNER COUNT cards
        card.winners.length.times do
            next_id = card.id.to_i + id_to_add
            # don't add card ids that don't exist
            if next_id <= lines.length
                add_card(total_cards, next_id.to_s)
                id_to_add += 1
            end
        end
    end
    # puts total_cards
end

puts total_cards
puts total_cards.values.sum