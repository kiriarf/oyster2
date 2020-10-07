require 'oystercard'

describe Oystercard do
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }
  let (:journey) {double :journey, entry_station: entry_station, exit_station: exit_station}

  describe '#initialize' do
    it 'should have balance of 0 on initialization' do
      expect(subject.balance).to eq(0)
    end

    it 'should have an empty journeys array on initialization' do
      expect(subject.journeys).to be_empty
    end
  end

  describe '#top_up' do
    it 'adds to the balance of the card' do
      expect { subject.top_up(5) }.to change{subject.balance}.by(5)
    end

    it 'raises an error if balance surpasses 90' do
      expect { subject.top_up(100) }.to raise_error "Card limit of #{Oystercard::CARD_LIMIT} exceeded."
    end
  end

  describe '#in_journey?' do
    it 'returns false on initialization' do
      expect(subject.in_journey?).to be false
    end
  end

  describe '#touch_in' do
    it 'changes value of in_use to true' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to be true
    end

    it "raises an error if card balance too low" do
      expect { subject.touch_in(entry_station) }.to raise_error("Balance too low.")
    end

    it "remembers the entry station" do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end
  end
  

  describe '#touch_out' do
    before do
      subject.top_up(5)
      subject.touch_in(entry_station)
    end

    it 'reduces the @balance by minimum fare' do
      expect { subject.touch_out(exit_station) }.to change{subject.balance}.by(-subject.journey_class::FARE)
    end

    it 'changes entry_station to nil' do
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq(nil)
    end

  end
end
