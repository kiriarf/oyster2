require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'should have balance of 0 on initialization' do
      expect(subject.balance).to eq(0)
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
      subject.touch_in
      expect(subject.in_journey?).to be true
    end

    it "raises an error if card balance too low" do
      expect { subject.touch_in }.to raise_error("Balance too low.")
    end
  end
  
  describe '#touch_out' do
    before do
      subject.top_up(5)
      subject.touch_in
    end

    it 'changes the value of in_use to false' do
      subject.touch_out
      expect(subject.in_journey?).to be false
    end

    it 'reduces the @balance by minimum fare' do
      expect { subject.touch_out }.to change{subject.balance}.by(-Oystercard::FARE)
    end
  end
end
