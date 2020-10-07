require 'journey'

describe Journey do
  subject(:journey) { described_class.new('entry station', "exit station") }

  describe '#initialize' do
    it 'has entry station' do
      expect(journey.entry_station).to eq('entry station')
    end

    it 'has exit station' do
      expect(journey.exit_station).to eq('exit station')
    end

    # it 'creates a journey' do
    #   expect(journey.current_journey).to eq({entry: 'entry station', exit: 'exit station'})
    # end
  end

  describe '#fare' do
    it 'returns minimum fare when entry and exit present' do
      expect(journey.fare).to eq(Journey::FARE)
    end

    it 'returns penalty when no entry or no exit' do
      new_journey = described_class.new('entry')
      expect(new_journey.fare).to eq(Journey::PENALTY)
    end

    it 'returns penalty when no exit and no entry' do
      new_journey = described_class.new
      expect(new_journey.fare).to eq(Journey::PENALTY)
    end 
  end
end