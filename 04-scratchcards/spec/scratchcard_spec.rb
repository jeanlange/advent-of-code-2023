require 'scratchcards'

describe Card do
    let(:card_text) { "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53" }
    let(:card) { Card.new(card_text) }

    context "creating a card" do
        it "finds the id" do
            expect(card.id).to eq "1"
        end

        it "finds winning numbers" do
            expect(card.winning_numbers).to include "41"
            expect(card.winning_numbers).to include "86"
            expect(card.winning_numbers.length).to eq 5
        end

        it "finds card_numbers" do
            expect(card.card_numbers).to include "83"
            expect(card.card_numbers.length).to eq 8
        end

        it "finds winners" do
            expect(card.winners).to include "48"
            expect(card.winners.length).to eq 4
        end

        it "scores card" do
            expect(card.score).to eq 8
        end
    end

    context "a 2-point card" do
        let(:card_text) { "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19" }
        it "scores 2 points" do
            expect(card.score).to eq 2
        end
    end

    context "a 0-point card" do
        let(:card_text) { "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11" }
        it "scores 0 points" do
            expect(card.score).to eq 0
        end
    end
end