require 'races'

describe Race do
    it "can do the first example" do
        r = Race.new(7, 9)
        expect(r.ways_to_win).to eq 4
    end

    it "can do the second" do
        r = Race.new(15, 40)
        expect(r.ways_to_win).to eq 8
    end

    it "can do the third" do
        r = Race.new(30, 200)
        expect(r.ways_to_win).to eq 9
    end
end