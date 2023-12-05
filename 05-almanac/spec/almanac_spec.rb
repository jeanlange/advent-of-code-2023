require 'almanac'

describe AlmanacRange do
    context "parsing a range" do
        let(:range) { AlmanacRange.new("50 98 2") }

        it "knows the original text" do
            expect(range.original_text).to eq "50 98 2"
        end

        it "finds the source start" do
            expect(range.source_start).to eq 50
        end

        it "finds the source end" do
            expect(range.source_end).to eq 51
        end

        it "stores an offset" do
            expect(range.offset).to eq 48
        end
    end

    context ".in_range?" do
        let(:range) { AlmanacRange.new("50 98 2") }

        it "answers yes" do
            expect(range.in_range?(51)).to eq true
        end

        it "answers no" do
            expect(range.in_range?(55)).to eq false
        end
    end

    context ".translate" do
        let(:range) { AlmanacRange.new("50 98 2") }

        it "translates numbers in range" do
            expect(range.translate(51)).to eq 99
        end

        it "leaves alone numbers out of range" do
            expect(range.translate(55)).to eq 55
        end
    end
end

describe AlmanacMapper do
    let(:lines) {
        [
            "seed-to-soil map:",
            "50 98 2",
            "52 50 48"
        ]
    }
    it "can parse a title line" do
        a = AlmanacMapper.new
        a.parse_title lines.first

        expect(a.title).to eq "seed to soil"
        expect(a.input).to eq "seed"
        expect(a.output).to eq "soil"
    end

    it "can parse a range line" do
        a = AlmanacMapper.new
        a.add_range lines[1]
        a.add_range lines[2]
        expect(a.ranges.length).to eq 2
    end

    context "a mapper with multiple ranges" do
        it "can map using its first range line" do
        end

        it "can map using its second" do
        end

        it "can map numbers not covered by a range" do
        end

end