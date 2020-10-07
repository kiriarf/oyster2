require 'station'

describe Station do
    subject(:subject) { Station.new("station", "zone") }
    describe '#initialize' do
        it 'has a name' do
            expect(subject.name).to eq("station")
        end

        it 'has a zone' do 
            expect(subject.zone).to eq("zone")
        end
    end
end